import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/home.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    Timer(
      Duration(seconds: 3),
      nextScreen,
    );
  }

  nextScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          duration: Duration(seconds: 1),
          type: PageTransitionType.fade,
          child: HomeScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 48, 1),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 100 * 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
              Text(
                'MIT Coins',
                style: TextStyle(color: Color(0xffFFCD4D), fontSize: 40),
              ),
              Text('One Uni - One Coin',
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
