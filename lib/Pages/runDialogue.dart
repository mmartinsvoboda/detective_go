import 'package:flutter/material.dart';
import 'package:detectivego/Dialogues/dialogue.dart';
import 'package:detectivego/gameManager.dart' as gameManager;

class RunDialogue extends StatefulWidget {
  RunDialogue(this.dialogue);

  final Dialogue dialogue;

  @override
  _RunDialogueState createState() => _RunDialogueState();
}

class _RunDialogueState extends State<RunDialogue> {
  int i = 1;

  @override
  Widget build(BuildContext context) {
    int dialogueLength = widget.dialogue.text.length;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(gameManager
              .characters[int.parse(widget.dialogue.assign[0])].jmeno.value),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          if (i >= dialogueLength) {
            Navigator.pop(context);
          } else {
            setState(() {
              i++;
            });
          }
          print(i <= dialogueLength ? i.toString() : "false");
        },
        child: Container(
          child: Column(
            children: <Widget>[
              Text(widget.dialogue.desctiption),
              Expanded(
                child: ListView.builder(
                  itemCount: i,
                  itemBuilder: (BuildContext context, int index) {
                    int charIndex = int.parse(
                        widget.dialogue.text[index].toString().split(":")[0]);
                    String charName = charIndex == 999
                        ? "Detektiv"
                        : gameManager.characters[charIndex].jmeno.value;
                    String line =
                        widget.dialogue.text[index].toString().split(":")[1];

                    bool isDetective = charIndex == 999 ? true : false;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: isDetective
                            ? BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                bottomLeft: Radius.circular(15.0),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0),
                              ),
                      ),
                      margin: isDetective
                          ? EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              left: 80.0,
                            )
                          : EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                              right: 80.0,
                            ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(charName),
                            Text(line),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
