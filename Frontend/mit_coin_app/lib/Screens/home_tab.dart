import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/event_details.dart';
import 'package:page_transition/page_transition.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hi, Tejas Mandhre!'),
                      Image.asset('assets/images/scan.png'),
                    ],
                  ),
                  Container(
                    width: 328,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xff212230),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
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
                                      "Your Balance",
                                      style: TextStyle(
                                        color: Color(0xffc0c0c0),
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "500 MIT Coins",
                                      style: TextStyle(
                                        color: Color(0xffffcd4c),
                                        fontSize: 24,
                                        fontFamily: "Avenir",
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "~500 INR",
                                  style: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: 13,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 40),
                            Container(
                              width: 80,
                              height: 80,
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.rotate(
                                    angle: 3.14,
                                    child: Container(
                                      width: 61.54,
                                      height: 61.54,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffffcd4c),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2465.87),
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                        colors: [
                                          Color(0xffffcd4c),
                                          Color(0xfff3af00)
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2465.87),
                                  Container(
                                    width: 34.98,
                                    height: 28.27,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child:
                                        FlutterLogo(size: 28.269224166870117),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                              "30 coins",
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
                              "10 coins",
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
                  Text(
                    "THIS MONTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff979797),
                      fontSize: 12,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Upcoming Events'),
                      Text('Explore All >'),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        upcomingEvent(context),
                        upcomingEvent(context),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Transaction'),
                      Text('View All >'),
                    ],
                  ),
                  tuckShop(),
                  tuckShop(),
                  tuckShop(),
                  tuckShop(),
                  tuckShop(),
                  tuckShop(),
                  tuckShop(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

tuckShop() {
  return Container(
    width: 328,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff151321),
    ),
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
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
                      child: FlutterLogo(size: 13.875),
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
                    "Tuck Shop",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "12 Mar 2022",
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(width: 114),
        Text(
          "3 Coins",
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xffffcd4c),
            fontSize: 14,
            fontFamily: "Avenir",
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}

upcomingEvent(context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        PageTransition(
          duration: Duration(seconds: 1),
          type: PageTransitionType.fade,
          child: EventDetails(),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
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
  );
}
