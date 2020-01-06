import 'package:flutter/material.dart';
import 'package:cooking_app/telas/receita.dart';
import '../telas/detalhes.dart';
import 'dart:convert';

class Detalhes extends StatelessWidget{

  final Receita receita;

  Detalhes({Key key, @required this.receita}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirAppBar(){
    return AppBar(title: Text('Detalhes'),
    );
  }

  Widget _construirDetalhes(){
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconeDetalhes('${receita.porcoes} porções', receita.tempoPreparo),
          _contruirSubtituloDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes),
          _contruirSubtituloDetalhes('Modo de Preparo'),
          _construirTextoDetalhes(receita.modoPreparo),
        ],
      ),
      appBar: _construirAppBar(),
    );
  }

  Widget _construirLinhaIconeDetalhes(rendimento, tempo_preparo){
    return Row(
      children: <Widget>[
        _construirColunaIconeDetalhes(Icons.restaurant, rendimento),
        _construirColunaIconeDetalhes(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _construirColunaIconeDetalhes(icone, texto){
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icone, color: Colors.blueGrey),
          Text(texto, style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold)),
        ],
    ));
  }

  Widget _contruirSubtituloDetalhes(subtitulo){
    return Center(
      child: Text(subtitulo, style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 17))
    );
  }

  Widget _construirTextoDetalhes(texto){
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(texto)
    );
  }

  Widget _construirImagemDetalhes(imagem){
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo){
    return Center(
        child: Text(titulo, style: TextStyle(
            color: Colors.blueGrey, fontSize: 30
        )),
    );
  }
}