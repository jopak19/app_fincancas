import 'package:financas/ui/datalhes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const urlRequest =
    "https://api.hgbrasil.com/finance?format=json-cors&key=6a2f9f37";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Map> carregaDados() async {
    var resposta = await http.get(Uri.parse(urlRequest));
    return jsonDecode(resposta.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Bolsa de valores"),
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<Map>(
          future: carregaDados(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text("Erro ao carregar resultados"));
            } else if (snapshot.hasData) {
              return builListView(snapshot.data!["results"]["stocks"]);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget builListView(Map json) {
    List bolsas = [];
    json.keys.forEach((key) => bolsas.add(key.toString()));

    return ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: bolsas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(bolsas[index]),
            subtitle: Text(json[bolsas[index]]["name"].toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Detalhes(bolsas[index], json[bolsas[index]])));
            },
          );
        });
  }
}
