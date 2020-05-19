import 'package:flutter/material.dart';
import 'package:detectivego/gameManager.dart' as gameManager;

import 'runDialogue.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Scaffold(
            appBar: AppBar(
              title: Text("Main Page list"),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: gameManager.characters.length,
                      itemBuilder: (context, index) {
                        if (!gameManager.characters[index].jmeno.isKnown) {
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
                        } else {
                          return SizedBox();
                        }
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
                              print(gameManager.locations[index].name);
                            },
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.redAccent,
                              child: Container(
                                  height: 50,
                                  child: Center(
                                    child: Text(
                                      gameManager
                                          .locations[index].keyword.length
                                          .toString(),
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
                                    builder: (context) => RunDialogue(
                                        gameManager.dialogues[index]),
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
            )));
  }
}
