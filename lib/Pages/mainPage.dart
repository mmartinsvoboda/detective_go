import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:detectivego/gameManager.dart' as gameManager;

import 'runDialogue.dart';
import 'mapPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Main Page list".toUpperCase())),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapPage(),
                        ));
                  },
                  child: Card(
                    child: Container(
                        height: 50, child: Center(child: Text("Mapa"))),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: gameManager.characters.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                gameManager.characters[index].jmeno.value,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: gameManager.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(gameManager.items[index].name);
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.blueAccent,
                          child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  gameManager.items[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: gameManager.locations.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          for (String char
                              in gameManager.locations[index].character) {
                            print(gameManager
                                .characters[int.parse(char)].jmeno.value);
                          }
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.redAccent,
                          child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  gameManager.locations[index].name.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: gameManager.dialogues.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          print(gameManager.dialogues[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RunDialogue(gameManager.dialogues[index]),
                              ));
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: Colors.amberAccent,
                          child: Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  gameManager.dialogues[index].id,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
