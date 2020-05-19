import 'package:flutter/material.dart';
import 'package:detectivego/gameManager.dart' as gameManager;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void wait() async {
    await gameManager.initialize();
    await Future.delayed(Duration(seconds: 1));
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    wait();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Detective Go',
      home: Scaffold(
        body: Center(
            child: SpinKitRotatingCircle(
          color: Colors.blueAccent,
          size: 150,
        )),
      ),
    );
  }
}
