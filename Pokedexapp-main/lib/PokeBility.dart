import 'package:flutter/material.dart';
import 'package:pokemon/PokeDetail.dart';

class Ability extends StatelessWidget {
  final Detail pokedetail;
  const Ability({Key key, this.pokedetail}) : super(key: key);

  bodyWidget() => Container();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.lightBlue,
          title: Text(
            pokedetail.name,
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Card(
          child: Column(
            children: [
              Image(
                image: NetworkImage(pokedetail.sprites, scale: 0.5),
              ),
              Row(
                children: [
                  Container(
                    child: Column(
                      children: [],
                    ),
                  ),
                  Text("Pokemon : ", style: TextStyle(fontSize: 20)),
                  Text(
                    pokedetail.name,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Text(
                "",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                "",
                style: TextStyle(fontSize: 25),
              ),
              Container(
                  child: Text(
                "Tipe Pokemon : ",
                style: TextStyle(fontSize: 25),
              )),
              //types
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: ListView.builder(
                        itemCount: pokedetail.types.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                child: Text(
                                  "-${pokedetail.types[index]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              ]),
              Container(
                  child: Text(
                "術 : ",
                style: TextStyle(fontSize: 25),
              )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: ListView.builder(
                        itemCount: pokedetail.moves.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                child: Text(
                                  "-${pokedetail.moves[index]}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ))));
  }
}
