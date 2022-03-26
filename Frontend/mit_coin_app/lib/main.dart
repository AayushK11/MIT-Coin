import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen()
    );
  }
}
