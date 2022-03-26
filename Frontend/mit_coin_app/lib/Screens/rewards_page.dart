import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/home.dart';
import 'package:page_transition/page_transition.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 48, 1),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 220),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Image.asset(
                        'assets/images/Rewards.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Text(
                        'You\'ve earned \n5 coins as a reward',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: "Avenir",
                            fontSize: 25,
                            height: 1.2,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 56),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(seconds: 1),
                              type: PageTransitionType.fade,
                              child: HomeScreen()),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Color(0xff0d6dcf),
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
                              "Back Home",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
