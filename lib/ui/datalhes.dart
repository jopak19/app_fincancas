import 'dart:convert';

import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  Map detalhesDados = {};
  String titulo = "";
  Detalhes(this.titulo, this.detalhesDados, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Text(
                "Nome: " + detalhesDados["name"].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Localização: " + detalhesDados["location"].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Pontos: " + detalhesDados["points"].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                "Variação: " + detalhesDados["variation"].toString(),
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(),
            ],
          ),
        ));
  }
}
