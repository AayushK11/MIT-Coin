import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mit_coin_app/Screens/home.dart';
import 'package:mit_coin_app/Screens/login_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalStorage my_storage = new LocalStorage('main');
  @override
  void initState() {
    super.initState();
    loginCheck();
    // makeGetRequest();
  }

  Future<void> loginCheck() async {
    final baseURL = 'http://dcb5-114-143-215-162.ngrok.io';
    final url =
        Uri.parse('$baseURL/accounts/login/');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');

    final response_json = jsonDecode(response.body);
    final response_message = response_json['message'];

    final isLoggedIn = response_message != "Wrong credentails";

    my_storage.setItem('email', 'shantanu@mit.com');
    my_storage.setItem('password', 'password');
    my_storage.setItem('token', response_message['token']);
    my_storage.setItem(
        'wallet_link', response_message['profile']['owner']['wallet_link']);
    my_storage.setItem('wallet_balance',
        response_message['profile']['owner']['wallet_balance']);
    my_storage.setItem('pk', response_message['profile']['pk']);
    my_storage.setItem('first_name', response_message['profile']['first_name']);
    my_storage.setItem('last_name', response_message['profile']['last_name']);
    my_storage.setItem('recent_transaction',
        response_message['profile']['recent_transaction']);
    my_storage.setItem(
        'total_spent', response_message['profile']['total_spent']);
    my_storage.setItem('recent_transaction',
        response_message['profile']['recent_transaction']);
    my_storage.setItem(
        'total_cashback', response_message['profile']['total_cashback']);
    my_storage.setItem('coin_value', response_message['profile']['coin_value']);

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
