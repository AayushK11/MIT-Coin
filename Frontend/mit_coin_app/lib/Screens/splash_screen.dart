import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/home.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // startTimer();
    makePostRequest();
    // makeGetRequest();
  }

  startTimer() async {
    Timer(
      Duration(seconds: 3),
      nextScreen,
    );
  }

  Future<void> makePostRequest() async {
    final url =
        Uri.parse('http://df1d-114-143-215-162.ngrok.io/accounts/login/');
    final json = '{"email": "shantanu@mit.com", "password": "password"}';
    final response = await post(url, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }

  Future<void> makeGetRequest() async {
    final url = Uri.parse('https://api.publicapis.org/entries');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
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
              Container(
                width: MediaQuery.of(context).size.width * 0.475,
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: (Text(
                  'MIT Coin',
                  style: TextStyle(
                      color: Color(0xffFFCD4D),
                      fontFamily: "Avenir",
                      fontSize: 37,
                      fontWeight: FontWeight.w900),
                )),
              ),
              Text('One Uni - One Coin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Avenir")),
            ],
          ),
        ),
      ),
    );
  }
}
