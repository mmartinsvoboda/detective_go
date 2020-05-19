import 'dart:async';

import 'gameLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

Future<List<GameLocation>> locationCreator(String xmlFile) async {
  List<GameLocation> locations = [];

  print("locationCreator started");
  WidgetsFlutterBinding.ensureInitialized();
  String xmlString = await rootBundle.loadString(xmlFile);
  var raw = xml.parse(xmlString);
  Iterable<xml.XmlElement> elements = raw.findAllElements("location");

  for (xml.XmlElement locationNode in elements) {
    GameLocation location = await createLocation(locationNode);
    //print(item.name);
    locations.add(location);
  }

  print("itemCreator finished");

  return locations;
}

Future<GameLocation> createLocation(xml.XmlElement itemNode) async {
  print("createLOCATION started");

  String _id, _name, _description, _lat, _long;
  bool _isKnown;
  List<String> _keyword, _character;

  _id = itemNode.findAllElements('id').first.text;
  _isKnown =
      (itemNode.findAllElements('isKnown').first.text.toLowerCase() == 'true');
  _name = itemNode.findAllElements('name').first.text;
  _description = itemNode.findAllElements('description').first.text;
  _lat = itemNode.findAllElements('lat').first.text;
  _long = itemNode.findAllElements('long').first.text;
  _keyword = await makeList('keyword', itemNode);
  _character = await makeList('character', itemNode);

  GameLocation location = GameLocation(
      _id, _isKnown, _name, _description, _lat, _long, _keyword, _character);

  print("createLOCATION finished for $_name");

  return location;
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
