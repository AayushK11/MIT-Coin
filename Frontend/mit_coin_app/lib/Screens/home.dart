import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/clubs_tab.dart';
import 'package:mit_coin_app/Screens/event_details.dart';
import 'package:mit_coin_app/Screens/home_tab.dart';
import 'package:mit_coin_app/Screens/profile_tab.dart';
import 'package:mit_coin_app/Screens/report_tab.dart';
import 'package:mit_coin_app/Screens/wallet_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    ClubsTab(),
    WalletTab(),
    ReportTab(),
    ProfileTab(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 34, 48, 1),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        color: Color(0xff151321),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: onTabTapped,
          selectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffFFCF00),
            fontFamily: "Avenir",
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffFFCF00).withOpacity(0.5),
            fontFamily: "Avenir",
          ),
          backgroundColor: Color(0xff151321),
          selectedItemColor: Color(0xffF3AF00),
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                  width: 27, child: Image.asset('assets/images/Home.png')),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 27, child: Image.asset('assets/images/Clubs.png')),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 27, child: Image.asset('assets/images/Wallet.png')),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 27, child: Image.asset('assets/images/Report.png')),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Container(
                  width: 27, child: Image.asset('assets/images/Profile.png')),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
