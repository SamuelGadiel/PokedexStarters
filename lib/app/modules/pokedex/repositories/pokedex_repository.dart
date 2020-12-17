import 'package:desafio2/app/modules/pokedex/models/fetch_model.dart';
import 'package:dio/dio.dart';

class PokedexRepository {
  final Dio dio;
  PokedexRepository(this.dio);

  final String url =
      "https://run.mocky.io/v3/4394eb11-88d0-4739-80d6-d37e31183225";

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
