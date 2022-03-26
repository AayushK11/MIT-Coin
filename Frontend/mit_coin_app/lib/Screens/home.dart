import 'package:flutter/material.dart';
import 'package:mit_coin_app/Screens/event_details.dart';
import 'package:mit_coin_app/Screens/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  final List<Widget> _children = [
    HomeTab(),
    HomeTab(),
    HomeTab(),
    HomeTab(),
    HomeTab(),
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/scan.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/scan.png'),
            label: 'Clubs',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/scan.png'),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/scan.png'),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/scan.png'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
