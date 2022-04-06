import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/bmi_screen.dart';
import 'package:flutter_app1/screens/intro_screen.dart';

void main() {
  runApp(GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        routes: {
          '/': (context) => IntroScreen(),
          '/bmi': (context) => BmiScreen(),
        },
        initialRoute: '/', // If you set initialRoute you cannot set home
    );//home: IntroScreen());
  }
}
