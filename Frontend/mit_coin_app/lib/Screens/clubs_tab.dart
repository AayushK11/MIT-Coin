import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/event_details.dart';
import 'package:page_transition/page_transition.dart';

class ClubsTab extends StatefulWidget {
  const ClubsTab({Key? key}) : super(key: key);

  @override
  State<ClubsTab> createState() => _ClubsTabState();
}

class _ClubsTabState extends State<ClubsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover student clubs",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 305,
              child: Text(
                "Be an active part of various student clubs in MIT",
                style: TextStyle(
                  color: Color(0xffc4c4c4),
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                              fontSize: 11,
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
                              fontSize: 11,
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
                              fontSize: 11,
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
                              fontSize: 10,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MIT School of Engineering",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "(11)",
                  style: TextStyle(
                    color: Color(0xffc4c4c4),
                    fontSize: 14,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w500,
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
  }
}

upcomingEvent(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.9,
    margin: EdgeInsets.only(left: 20, top: 15),
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
      right: 12,
    ),
    child: TextButton(
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
        width: MediaQuery.of(context).size.width * 0.9,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10 Coins",
                  style: TextStyle(
                    color: Color(0xffffcd4c),
                    fontSize: 12,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                TextButton(
                    onPressed: null,
                    child: Text(
                      "Learn more >",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    ),
  );
}
