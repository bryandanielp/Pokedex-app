import 'package:flutter/material.dart';
import 'package:pokemon/PokeBility.dart';
import 'package:pokemon/src.dart';
import 'package:pokemon/PokeDetail.dart';
import 'package:pokemon/PokeLink.dart';
import 'PokeDetail.dart';
import 'package:flutter/cupertino.dart.';

void main() => runApp(MaterialApp(
      title: "P@kedex",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Detail> pokelist;
  List<Detail> get pokemon => pokelist;
  int num = 0;
  bool isSearching = false;
  String keys;
  getPokeData() async {
    if (pokelist == null) {
      // ignore: deprecated_member_use
      pokelist = new List<Detail>();
    }
    if (num < 152) {
      for (var n = 0; n < 151; n++) {
        num++;
        print('pulling data from pokemon index number ${num.toString()}');

        var pull = await Pokepull.fetchpokemon(num.toString());
        if (pull != null) {
          setState(() {
            pokelist.add(Detail.detafromJson(pull));
          });
        }
      }
      print(pokelist.length);
      return pokelist;
    }
  }

  @override
  void initState() {
    super.initState();
    getPokeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          title: !isSearching
              ? Text("Pokedexapp")
              : TextField(
              onSubmitted: (value) {
                setState(() {
                  keys = value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Find(src: keys)));
                });
              },
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.blueGrey,
                  ),
                  hintText: "Search For Pokemon",
                  hintStyle: TextStyle(color: Colors.black))),
          actions: <Widget>[
            isSearching
                ? IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    this.isSearching = !this.isSearching;
                  });
                })
                : IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  this.isSearching = !this.isSearching;
                });
              },
            )
          ],
          backgroundColor: Colors.green,
        ),
      body: Container(
            child: pokelist.length > 0
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.8),
                    itemCount: pokelist.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return Card(
                        elevation: 10.0,
                        color: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        margin: EdgeInsets.fromLTRB(15.0, 12.0, 15.0, 12.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(children: [
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Ability(
                                                pokedetail: pokelist[index],
                                              )));
                                  SizedBox(height: 6.0);
                                },
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            pokelist[index].sprites)),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "#${pokelist[index].num} ${pokelist[index].name}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11),
                                ))
                          ]),
                        ),
                      );
                    },
                  )
                : Container(
                    child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ))));
  }
}
