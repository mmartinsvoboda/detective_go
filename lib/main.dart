import 'package:flutter/material.dart';
// Pages
import 'package:detectivego/Pages/loading.dart';
import 'package:detectivego/Pages/mapPage.dart';
import 'package:detectivego/Pages/mainPage.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
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
  });
}
