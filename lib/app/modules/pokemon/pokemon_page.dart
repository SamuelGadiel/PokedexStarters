import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio2/app/modules/pokedex/models/fetch_model.dart';
import 'package:flutter/material.dart';

class PokemonPage extends StatefulWidget {
  final FetchModel pokemon;

  const PokemonPage({Key key, @required this.pokemon}) : super(key: key);

  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    FetchModel pokemon = widget.pokemon;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pokemon #" + pokemon.id),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            ImageCarousel(pokemon: pokemon),
            Text(
              "Dados",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black38,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
              margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "ID: ", style: boldTextStyle()),
                    TextSpan(
                        text: "\t" * 15 + pokemon.id, style: normalTextStyle()),
                    TextSpan(text: "\nNome: ", style: boldTextStyle()),
                    TextSpan(
                      text: "\t" * 8 + pokemon.name,
                      style: normalTextStyle(),
                    ),
                    TextSpan(text: "\nTipo: ", style: boldTextStyle()),
                    TextSpan(
                      text: "\t" * 11 + pokemon.type,
                      style: normalTextStyle(),
                    ),
                    TextSpan(text: "\nGeração: ", style: boldTextStyle()),
                    TextSpan(
                      text: "\t" * 4 + pokemon.generation,
                      style: normalTextStyle(),
                    ),
                    TextSpan(text: "\nRegião: ", style: boldTextStyle()),
                    TextSpan(
                      text: "\t" * 6 + pokemon.region,
                      style: normalTextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle normalTextStyle() {
    return TextStyle(
      fontSize: 18.0,
      color: Colors.black45,
      wordSpacing: 10,
    );
  }

  TextStyle boldTextStyle() {
    return TextStyle(
        fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600);
  }
}

class ImageCarousel extends StatelessWidget {
  final FetchModel pokemon;

  ImageCarousel({@required this.pokemon});

  @override
  Widget build(_) {
    List<Image> list = [
      Image.network(pokemon.design, fit: BoxFit.cover, height: 300),
      Image.network(pokemon.sprite, fit: BoxFit.cover, height: 300),
    ];

    return CarouselSlider(
      options: CarouselOptions(enableInfiniteScroll: false, height: 350),
      items: list.map((i) {
        return Builder(
          builder: (_) {
            return Column(children: [
              SizedBox(height: 5),
              Container(
                child: i,
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 7.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
            ]);
          },
        );
      }).toList(),
    );
  }
}
