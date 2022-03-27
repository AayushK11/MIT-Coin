import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mit_coin_app/Screens/success_massage.dart';
import 'package:page_transition/page_transition.dart';

class CheckoutSecurityScreen extends StatefulWidget {
  const CheckoutSecurityScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutSecurityScreen> createState() => _CheckoutSecurityScreenState();
}

class _CheckoutSecurityScreenState extends State<CheckoutSecurityScreen> {
  final LocalStorage my_storage = new LocalStorage('main');

  Future<void> loginCheck() async {
    final baseURL = 'http://dcb5-114-143-215-162.ngrok.io';
    final url = Uri.parse('$baseURL/accounts/login/');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
    my_storage.setItem('cashback_recent', jsonDecode(response.body));

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
  }

  Future<void> makeGetRequest() async {
    final baseURL = 'http://dcb5-114-143-215-162.ngrok.io';
    final sender =
        'b3dac62e85abc71e3092e8431c0f46e8b53a9620ce26ac5d8226a57cf5b3d1ca';
    final receiver = my_storage.getItem('receiver').substring(7);
    final amount = my_storage.getItem('amount');
    final url =
        Uri.parse('$baseURL/accounts/transact/$sender/$receiver/$amount');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');

    loginCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 48, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 34, 48, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xff151321),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Enter Password to complete transaction",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 52,
                              margin: EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xff696969)),
                              child: Container(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.all(10)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 40),
                child: TextButton(
                  onPressed: () {
                    makeGetRequest();
                    Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 250),
                          type: PageTransitionType.bottomToTop,
                          child: SuccessScreen()),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xfff3af00),
                    ),
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Pay 15 Coins",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
