import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mit_coin_app/Screens/event_details.dart';
import 'package:mit_coin_app/Screens/qr_scanner.dart';
import 'package:page_transition/page_transition.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final LocalStorage my_storage = new LocalStorage('main');
  var first_name = 'Tejas';
  var last_name = 'Mandre';
  var wallet_balance = '500';
  var coin_value = '10';
  var total_spent = '30';
  var total_cashback = '10';

  @override
  void initState() {
    // TODO: implement initState
    first_name = my_storage.getItem('first_name');
    last_name = my_storage.getItem('last_name');
    wallet_balance = my_storage.getItem('wallet_balance');
    coin_value = my_storage.getItem('coin_value').toString();
    total_spent = my_storage.getItem('total_spent').toString();
    total_cashback = my_storage.getItem('total_cashback').toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Color(0xff151321),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 15,
                      left: 25,
                      right: 15,
                      bottom: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi, $first_name $last_name!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                duration: Duration(milliseconds: 250),
                                type: PageTransitionType.rightToLeft,
                                child: ScannerScreen(),
                              ),
                            );
                          },
                          child: Image.asset('assets/images/scan.png'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff212230),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Balance",
                              style: TextStyle(
                                color: Color(0xffc0c0c0),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${double.parse(wallet_balance).toStringAsFixed(2)} MIT Coins",
                              style: TextStyle(
                                color: Color(0xffffcd4c),
                                fontSize: 24,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "~${(double.parse(wallet_balance) * double.parse(coin_value)).toStringAsFixed(2)} INR",
                              style: TextStyle(
                                color: Color(0xffc0c0c0),
                                fontSize: 13,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height:
                                MediaQuery.of(context).size.height / 100 * 10,
                            child: Image.asset('assets/images/logo.png'))
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff212230),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${total_spent != '[]' ? total_spent : 0} coins",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "SPENT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffc0c0c0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 24),
                        Transform.rotate(
                          angle: 1.57,
                          child: Container(
                            width: 42,
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 24),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${total_cashback != '[]' ? double.parse(total_cashback).toStringAsFixed(2) : 0} coins",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "REWARD",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffc0c0c0),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "THIS MONTH",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff979797),
                        fontSize: 12,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Upcoming Events",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 25, 5),
                          child: Text(
                            "Explore all ➜",
                            style: TextStyle(
                              color: Color(0xff2b99ff),
                              fontSize: 14,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          upcomingEvent(context),
                          upcomingEvent(context),
                          SizedBox(width: 20)
                        ],
                      ),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Recent Transaction",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 25, 5),
                            child: (Text(
                              "View all ➜",
                              style: TextStyle(
                                color: Color(0xff2b99ff),
                                fontSize: 14,
                                fontFamily: "Avenir",
                                fontWeight: FontWeight.w800,
                              ),
                            )))
                      ],
                    ),
                  ),
                  tuckShop(context, "Tuck Shop", "26 Mar 2022", "1 coins"),
                  tuckShop(context, "Tuck Shop", "27 Mar 2022", "2 coins"),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

tuckShop(context, name, date, cost) {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff151321),
    ),
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 133,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xff212230),
                ),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 16.12,
                      height: 13.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/images/tuck_shop.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    date,
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          cost,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xffffcd4c),
            fontSize: 16,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}

upcomingEvent(context) {
  return Container(
    margin: EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Color(0xff07335c),
      borderRadius: BorderRadius.circular(7),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff07335c), Color(0xff194166)],
      ),
    ),
    padding: const EdgeInsets.only(
      left: 12,
      right: 48,
    ),
    child: TextButton(
      onPressed: () {
        Navigator.push(
          context,
          PageTransition(
            duration: Duration(milliseconds: 250),
            type: PageTransitionType.rightToLeft,
            child: EventDetails(),
          ),
        );
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AI/ML workshop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "by Robotics club",
                  style: TextStyle(
                    color: Color(0xffe5e5e5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "10 MIT Coins",
              style: TextStyle(
                color: Color(0xffffcd4c),
                fontSize: 12,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
