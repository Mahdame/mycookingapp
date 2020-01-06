import 'package:flutter/material.dart';
import 'package:cooking_app/telas/receita.dart';
import '../telas/detalhes.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
        body: SizedBox(
            child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
          builder: (context, snapshot) {
            List<dynamic> receitas = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Receita receita = Receita.fromJson(receitas[index]);
                return _construirCard(receita);
              },
              itemCount: receitas == null ? 0 : receitas.length,
            );
          },
        )),
        appBar: _construirAppBar('My Cooking App'));
  }

  Widget _construirCard(receita) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Detalhes(receita: receita)));
        },
        child: SizedBox(
          height: 300,
          child: Card(
              margin: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      _construirImagemCard(receita.foto),
                      _construirTituloCard(receita.titulo)
                    ],
                  ),
                ],
              )),
        ));
  }

  Widget _construirImagemCard(imagem) {
    return Image.asset(
      imagem,
      fit: BoxFit.fill,
      height: 238,
    );
  }

  Widget _construirTituloCard(titulo) {
    return Positioned(
        bottom: 10.0,
        left: 10.0,
        child:
            Text(titulo, style: TextStyle(color: Colors.black, fontSize: 20)));
  }

  Widget _construirAppBar(titulo) {
    return AppBar(title: Text(titulo));
  }
}
