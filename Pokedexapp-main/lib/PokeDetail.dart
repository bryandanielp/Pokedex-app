import 'package:flutter/cupertino.dart';

class Detail {
  int num;
  String name;
  List<String> types;
  String sprites;
  List<String> moves;

  Detail(
      {this.num,
      this.name,
      this.types,
      this.moves,
      this.sprites});

  factory Detail.detafromJson(Map<String, dynamic> json) {
    List<String> _types = (json['types'] as List)
        .map((data) => data['type']['name'].toString())
        .toList();
    List<String> _moves = (json['moves'] as List)
        .map((data) => data['move']['name'].toString())
        .toList();

    return Detail(
        num: json['id'],
        name: json['name'],
        types: _types,
        sprites: json['sprites']['front_default'],
        moves: _moves);
  }
}
