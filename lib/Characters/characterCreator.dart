import 'dart:async';

import 'package:detectivego/Characters/charAttribute.dart';
import 'package:detectivego/Characters/character.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xml/xml.dart' as xml;

Future<List<Character>> characterCreator(String xmlFile) async {
  List<Character> characters = [];

  print("characterCreator started");
  WidgetsFlutterBinding.ensureInitialized();
  String xmlString = await rootBundle.loadString(xmlFile);
  var raw = xml.parse(xmlString);
  Iterable<xml.XmlElement> elements = raw.findAllElements("osoba");

  for (xml.XmlElement person in elements) {
    Character character = await createCharacter(person);
    characters.add(character);
  }

  print("characterCreator finished");

  return characters;
}

Future<Character> createCharacter(xml.XmlElement person) async {
  print("createCharacter started");

  Character character = Character(
      await createCharAttribute(person, "fotka"),
      await createCharAttribute(person, "jmeno"),
      await createCharAttribute(person, "prijmeni"),
      await createCharAttribute(person, "prezdivka"),
      await createCharAttribute(person, "man"),
      await createCharAttribute(person, "datumnarozeni"),
      await createCharAttribute(person, "jeNazivu"),
      await createCharAttribute(person, "datumumrti"),
      await createCharAttribute(person, "narodnost"),
      await createCharAttribute(person, "vyska"),
      await createCharAttribute(person, "vaha"),
      await createCharAttribute(person, "mobil"),
      await createCharAttribute(person, "povolani"),
      await createCharAttribute(person, "vztahKuObeti"),
      await createCharAttribute(person, "otiskprstu"),
      await createCharAttribute(person, "DNA"),
      await createCharAttribute(person, "alibi"),
      await createCharAttribute(person, "jeSvedek"),
      await createCharAttribute(person, "jeZnamy"),
      await createCharAttribute(person, "jeHlavniPodezrely"),
      await createCharAttribute(person, "jePodezrely"),
      await createCharAttribute(person, "jeNevinny"),
      await createCharAttribute(person, "color"),
      await createCharAttribute(person, "jeObet"),
      await createCharAttribute(person, "jeHledanaOsoba"),
      await createCharAttribute(person, "trpelivost"),
      await createCharAttributeList(person, ""),
      await createCharAttributeList(person, ""));
  print("createCharacter finished");

  return character;
}

Future<CharAttribute> createCharAttribute(
    xml.XmlElement parent, String keyword) async {
  xml.XmlElement element = parent.findAllElements(keyword).first;

  return CharAttribute(
      element.text,
      element.attributes[0]
              .toString()
              .split("=")[1]
              .replaceAll("'", " ")
              .trim()
              .toLowerCase() ==
          'true',
      element.attributes[1]
          .toString()
          .split("=")[1]
          .replaceAll("'", " ")
          .trim());
}

Future<List<CharAttribute>> createCharAttributeList(
    xml.XmlElement parent, String keyword) async {
  Iterable<xml.XmlElement> elements = parent.findAllElements(keyword);
  List<CharAttribute> elementList;

  elements.forEach((element) async {
    elementList.add(await createCharAttribute(element, keyword));
  });

  return elementList;
}
