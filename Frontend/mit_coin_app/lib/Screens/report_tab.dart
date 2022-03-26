import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({Key? key}) : super(key: key);

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                child: Text(
                  "Discover Student Clubs",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              width: MediaQuery.of(context).size.width,
              child: SizedBox(
                width: 305,
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                  child: Text(
                    "Be an active part of various student clubs in MIT",
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontFamily: "Avenir",
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(47),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "School of Engineering",
                            style: TextStyle(
                              color: Color(0xff212230),
                              fontSize: 13,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(47),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.75,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "School of Design",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(47),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.75,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "School of Food tech",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(47),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.75,
                        ),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "College of Fine Arts",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Text(
                    "MIT School of Engineering",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Text(
                    "(11)",
                    style: TextStyle(
                      color: Color(0xffc4c4c4),
                      fontSize: 15,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            upcomingEvent(context),
            upcomingEvent(context),
            upcomingEvent(context),
            upcomingEvent(context),
            upcomingEvent(context),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
    ;
  }
}

upcomingEvent(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff005e2b), Color(0xff26674c)],
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 296,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Student Clubs",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(width: 176),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    padding: const EdgeInsets.only(
                      bottom: 4,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: 3.14,
                          child: Container(
                            width: 12.31,
                            height: 12.31,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffffcd4c),
                            ),
                          ),
                        ),
                        SizedBox(height: 2446.07),
                        Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [Color(0xffffcd4c), Color(0xfff3af00)],
                            ),
                          ),
                        ),
                        SizedBox(height: 2446.07),
                        Container(
                          width: 7,
                          height: 5.65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: FlutterLogo(size: 5.653942584991455),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "50 coins",
                    style: TextStyle(
                      color: Color(0xffffcd4c),
                      fontSize: 14,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 295.50,
              height: 0.50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffc4c4c4),
                  width: 0.50,
                ),
              ),
            ),
            SizedBox(height: 12),
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
                    Text(
                      "Overall share",
                      style: TextStyle(
                        color: Color(0xffc4c4c4),
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "50%",
                      style: TextStyle(
                        color: Color(0xff4de088),
                        fontSize: 16,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
