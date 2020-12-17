import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Desafio 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/pokedex.jpg', width: 250.0, height: 250.0),
            Text(
              "Exemplo de Pokedex",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 36.0),
            ElevatedButton(
              child: Text(
                "Acessar Pokedex",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Modular.to.pushNamed("/pokedex");
              },
            ),
            ElevatedButton(
              child: Text(
                "Sobre",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Modular.to.pushNamed("/sobre");
              },
            )
          ],
        ),
      ),
    );
  }
}
