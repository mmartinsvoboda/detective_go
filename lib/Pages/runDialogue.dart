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
          child: Text(
              "${gameManager.characters[int.parse(widget.dialogue.assign[0])].jmeno.value.toString().toUpperCase()} ${gameManager.characters[int.parse(widget.dialogue.assign[0])].prijmeni.value.toString().toUpperCase()}"),
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
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(widget.dialogue.desctiption),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
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

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.all(Radius.circular(19)),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Column(
                            crossAxisAlignment: isDetective
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                charName,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 11),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(line),
                            ],
                          ),
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
