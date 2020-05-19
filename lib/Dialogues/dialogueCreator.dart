import 'dart:async';

import 'dialogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

Future<List<Dialogue>> dialogueCreator(String xmlFile) async {
  List<Dialogue> dialogues = [];

  print("dialogueCreator started");
  WidgetsFlutterBinding.ensureInitialized();
  String xmlString = await rootBundle.loadString(xmlFile);
  var raw = xml.parse(xmlString);
  Iterable<xml.XmlElement> elements = raw.findAllElements("dialogue");

  for (xml.XmlElement dialogueNode in elements) {
    Dialogue dialogue = await createDialogue(dialogueNode);
    //print(dialogue.name);
    dialogues.add(dialogue);
  }

  print("dialogueCreator finished");

  return dialogues;
}

Future<Dialogue> createDialogue(xml.XmlElement itemNode) async {
  print("createDIALOGUE started");

  String _id, _description, _type, _asker, _subject;
  bool _beenTold, _revealed;
  List<String> _assign, _text, _toReveal;

  _id = itemNode.findAllElements('id').first.text;
  _description = itemNode.findAllElements('description').first.text;
  _beenTold =
      (itemNode.findAllElements('beenTold').first.text.toLowerCase() == 'true');
  _assign = await makeList("assign", itemNode);
  _type = itemNode.findAllElements('type').first.text;
  _asker = itemNode.findAllElements('asker').first.text;
  _subject = itemNode.findAllElements('subject').first.text;
  _text = await makeList("text", itemNode);
  _revealed = itemNode.findAllElements('revealed').first.text == 'true';
  _toReveal = await makeList("toReveal", itemNode);

  Dialogue dialogue = Dialogue(_id, _description, _beenTold, _assign, _type,
      _asker, _subject, _text, _revealed, _toReveal);

  print("createDIALOGUE finished for $_id");

  return dialogue;
}

Future<List<String>> makeList(String key, xml.XmlElement itemNode) async {
  List<String> list = [];

  itemNode.findAllElements(key).forEach((element) {
    if (element.text != "") {
      list.add(element.text);
    }
  });

  return list;
}
