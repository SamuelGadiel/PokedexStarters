import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sobre"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Desafio criado por",
              style: TextStyle(
                  fontSize: 26.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20.0),
            Icon(Icons.person,
                size: 150.0, color: Theme.of(context).primaryColor),
            Text(
              "Samuel G.",
              style: TextStyle(
                  fontSize: 36.0,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Desenvolvedor Mobile",
              style: TextStyle(
                  fontSize: 24.0, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 50.0),
            Text(
              "Code Tecnologia",
              style: TextStyle(
                  fontSize: 20.0, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
