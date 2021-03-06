import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({Key? key}) : super(key: key);

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  final LocalStorage my_storage = new LocalStorage('main');

  var wallet_balance = '500';
  var coin_value = '10';

  @override
  void initState() {
    // TODO: implement initState
    wallet_balance = my_storage.getItem('wallet_balance');
    coin_value = my_storage.getItem('coin_value').toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              width: MediaQuery.of(context).size.width,
              color: Color(0xff151321),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 10, 0),
                    child: Text(
                      "Your Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xff212230),
                    ),
                    child: Row(
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
                                    fontFamily: "Avenir",
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "${double.parse(wallet_balance).toStringAsFixed(2)} coins",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Current value",
                                  style: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: 14,
                                    fontFamily: "Avenir",
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "${double.parse(coin_value).toStringAsFixed(2)} INR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 106),
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
                                  "Equivalent",
                                  style: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: 14,
                                    fontFamily: "Avenir",
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "INR ${(double.parse(wallet_balance) * double.parse(coin_value)).toStringAsFixed(2)}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: "Avenir",
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Forecasted Value",
                                  style: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: 14,
                                    fontFamily: "Avenir",
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "9.763 INR",
                                  style: TextStyle(
                                    color: Color(0xFF0D6DC5),
                                    fontSize: 18,
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
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 20, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            "Transaction History",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  tuckShop(context, "Tuck Shop", "24 Mar 2022", "5 coins"),
                  tuckShop(context, "Tuck Shop", "25 Mar 2022", "3 coins"),
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
