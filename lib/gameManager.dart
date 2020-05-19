import 'package:detectivego/Characters/character.dart';
import 'package:detectivego/Characters/characterCreator.dart';

import 'package:detectivego/Items/item.dart';
import 'package:detectivego/Items/itemCreator.dart';

import 'package:detectivego/Locations/gameLocation.dart';
import 'package:detectivego/Locations/locationCreator.dart';

import 'package:detectivego/Dialogues/dialogue.dart';
import 'package:detectivego/Dialogues/dialogueCreator.dart';

import 'dart:async';
import 'package:flutter/material.dart';

List<Character> characters = [];
List<Item> items = [];
List<GameLocation> locations = [];
List<Dialogue> dialogues = [];

Future<void> initialize() async {
  await getChars();
  await getItems();
  await getLocations();
  await getDialogues();
}

Future<void> getChars() async {
  String xmlFile = "assets/characters.xml";
  WidgetsFlutterBinding.ensureInitialized();

  characters = (await characterCreator(xmlFile));
}

Future<void> getItems() async {
  String xmlFile = "assets/items.xml";
  WidgetsFlutterBinding.ensureInitialized();

  items = (await itemCreator(xmlFile));
}

Future<void> getLocations() async {
  String xmlFile = "assets/locations.xml";
  WidgetsFlutterBinding.ensureInitialized();

  locations = (await locationCreator(xmlFile));
}

Future<void> getDialogues() async {
  String xmlFile = "assets/dialogues.xml";
  WidgetsFlutterBinding.ensureInitialized();

  dialogues = (await dialogueCreator(xmlFile));
}
