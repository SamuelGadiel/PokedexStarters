import 'package:desafio2/app/modules/pokedex/models/fetch_model.dart';
import 'package:dio/dio.dart';

class PokedexRepository {
  final Dio dio;
  PokedexRepository(this.dio);

  final String url = "https://pokemon-flutter-api.herokuapp.com/";

  Future<List<FetchModel>> getPokemons() async {
    var request = await dio.get(url);

    List response = request.data as List;

    List<FetchModel> data = new List<FetchModel>.filled(
        response.length, FetchModel(),
        growable: true);

    data = response
        .map((json) => FetchModel(
              id: json['id'],
              name: json['name'],
              type: json['type'],
              generation: json['generation'],
              region: json['region'],
              sprite: json['sprite'],
              design: json['design'],
            ))
        .toList();

    return data;
  }
}
