import 'package:desafio2/app/modules/pokedex/repositories/pokedex_repository.dart';
import 'package:desafio2/app/modules/pokemon/pokemon_module.dart';
import 'package:dio/dio.dart';

import 'pokedex_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokedex_page.dart';

class PokedexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokedexPage()),
        Bind((i) => PokedexBloc()),
        Bind((i) => Dio()),
        Bind((i) => PokedexRepository(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => PokedexPage()),
        ModularRouter('/pokemon', module: PokemonModule()),
      ];

  static Inject get to => Inject<PokedexModule>.of();
}
