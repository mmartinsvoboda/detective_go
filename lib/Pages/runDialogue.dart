import 'package:flutter/material.dart';
import 'package:detectivego/Dialogues/dialogue.dart';

class RunDialogue extends StatelessWidget {
  RunDialogue(this.dialogue);

  final Dialogue dialogue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(dialogue.text.toString()),
      ),
    );
  }
}
