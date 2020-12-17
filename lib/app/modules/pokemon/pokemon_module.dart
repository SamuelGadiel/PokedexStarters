import 'pokemon_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pokemon_page.dart';

class PokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => PokemonPage()),
        Bind((i) => PokemonBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/:pokemon",
            child: (_, args) => PokemonPage(pokemon: args.data)),
      ];

  static Inject get to => Inject<PokemonModule>.of();
}
