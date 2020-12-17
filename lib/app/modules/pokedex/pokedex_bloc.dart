import 'package:desafio2/app/modules/pokedex/repositories/pokedex_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rxdart/rxdart.dart';

class PokedexBloc extends Disposable {
  final repository = Modular.get<PokedexRepository>();

  final BehaviorSubject<List> fetchStream = BehaviorSubject<List>();
  final loadState = BehaviorSubject<bool>.seeded(false);
  final errorState = BehaviorSubject<bool>.seeded(false);

  Future getData() async {
    List dados = await repository.getPokemons();

    Future.delayed(Duration(seconds: 2));

    if (dados.isNotEmpty) {
      loadState.sink.add(true);
      fetchStream.sink.add(dados);

      if (errorState.value == true) {
        errorState.sink.add(false);
      }
    } else {
      errorState.sink.add(true);
    }
  }

  bool get containsError {
    return errorState.value;
  }

  bool get isLoaded {
    return loadState.value;
  }

  @override
  dispose() {
    fetchStream.close();
    loadState.close();
    errorState.close();
  }
}
