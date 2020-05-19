import 'package:flutter/material.dart';
// Pages
import 'package:detectivego/Pages/loading.dart';
import 'package:detectivego/Pages/mapPage.dart';
import 'package:detectivego/Pages/mainPage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Typewriter',
      ),
      //initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => MainPage(),
        //'/location': (context) => ChooseLocation(),
      }));
}
