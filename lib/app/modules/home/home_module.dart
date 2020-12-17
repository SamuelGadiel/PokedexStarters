import 'package:desafio2/app/modules/pokedex/pokedex_module.dart';

import 'home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter(
          "/pokedex",
          module: PokedexModule(),
          transition: TransitionType.noTransition,
        ),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
