import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(33, 34, 48, 1),
      body:  SafeArea(child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Hi, Tejas Mandhre!'), Image.asset('assets/images/scan.png'),
        ],),
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
        children:[
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                            Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
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
                        padding: const EdgeInsets.only(bottom: 20, ),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
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
                                        gradient: LinearGradient(begin: Alignment.centerRight, end: Alignment.centerLeft, colors: [Color(0xffffcd4c), Color(0xfff3af00)], ),
                                    ),
                                ),
                                SizedBox(height: 2465.87),
                                Container(
                                    width: 34.98,
                                    height: 28.27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: FlutterLogo(size: 28.269224166870117),
                                ),
                            ],
                        ),
                    ),
                ],
            ),
        ],
    ),
)
      ],)),
    );
  }
}