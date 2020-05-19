import 'dart:async';

import 'item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

Future<List<Item>> itemCreator(String xmlFile) async {
  List<Item> items = [];

  print("itemCreator started");
  WidgetsFlutterBinding.ensureInitialized();
  String xmlString = await rootBundle.loadString(xmlFile);
  var raw = xml.parse(xmlString);
  Iterable<xml.XmlElement> elements = raw.findAllElements("item");

  for (xml.XmlElement itemNode in elements) {
    Item item = await createItem(itemNode);
    //print(item.name);
    items.add(item);
  }

  print("itemCreator finished");

  return items;
}

Future<Item> createItem(xml.XmlElement itemNode) async {
  print("createITEM started");

  String id, isKnown, name, pic, description, text, defanswer, isNote, noteText;

  //print("id");
  id = itemNode.findAllElements('id').first.text;
  //print("isKnown");
  isKnown = itemNode.findAllElements('isKnown').first.text;
  //print("name");
  name = itemNode.findAllElements('name').first.text;
  //print("pic");
  pic = itemNode.findAllElements('pic').first.text;
  //print("description");
  description = itemNode.findAllElements('description').first.text;
  //print("text");
  text = itemNode.findAllElements('text').first.text;
  //print("defAnswer");
  defanswer = itemNode.findAllElements('defanswer').first.text;
  //print("isNote");
  isNote = itemNode.findAllElements('isNote').first.text;
  //print("noteText");
  noteText = itemNode.findAllElements('notetext').first.text;
  //print("finished");

  Item item = Item(
      id, isKnown, name, pic, description, text, defanswer, isNote, noteText);

  print("createITEM finished for $name");

  return item;
}
