import 'package:desafio2/app/modules/pokedex/models/fetch_model.dart';
import 'package:desafio2/app/modules/pokedex/pokedex_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// JSON to fetch
// https://run.mocky.io/v3/81034ccc-e168-47ba-8e38-1cdc0fd27b90

class PokedexPage extends StatelessWidget {
  final pokedexBloc = Modular.get<PokedexBloc>();

  // PokedexBloc pokedexBloc = Modular.get();
  checkColor(pokemon) {
    switch (pokemon.type) {
      case "Grass":
        return Colors.green[300];
      case "Fire":
        return Colors.red[300];
      case "Water":
        return Colors.blue[300];
      case "Electric":
        return Colors.yellow;
    }
  }

  Color textColor(pokemon) {
    Color background = checkColor(pokemon);
    return background.computeLuminance() >= 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Pokedex"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: pokedexBloc.fetchStream.stream,
            initialData: pokedexBloc.getData(),
            builder: (context, snapshot) {
              if (pokedexBloc.containsError) {
                return ShowError();
              } else if (!pokedexBloc.isLoaded) {
                return CircularProgressIndicator();
              } else {
                List pokemons = snapshot.data as List;

                return ListView.builder(
                  itemCount: pokemons.length,
                  itemBuilder: (context, index) {
                    FetchModel pokemon = pokemons[index];
                    return ListTile(
                      horizontalTitleGap: 10.0,
                      contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                      title: Text(
                        pokemon.name,
                        style: TextStyle(fontSize: 17.0),
                      ),
                      leading: Image.network(
                        pokemon.sprite,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                      trailing: Text(
                        "#" + pokemon.id,
                        style: TextStyle(fontSize: 18.0, color: Colors.black26),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 60.0,
                              height: 22.0,
                              decoration: BoxDecoration(
                                color: checkColor(pokemon),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                border: Border.all(color: checkColor(pokemon)),
                              ),
                              child: Text(
                                pokemon.type,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: textColor(pokemon)),
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                      onTap: () {
                        Modular.to
                            .pushNamed('/pokedex/pokemon/', arguments: pokemon);
                      },
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

class ShowError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Icons.error_outline_rounded,
        Icon(Icons.error_outline_rounded, color: Colors.red, size: 150.0),
        Text(
          "Serviço Indisponivel",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
