import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mit_coin_app/Screens/checkout_security_page.dart';
import 'package:page_transition/page_transition.dart';

class CheckoutAmountScreen extends StatefulWidget {
  const CheckoutAmountScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutAmountScreen> createState() => _CheckoutAmountScreenState();
}

class _CheckoutAmountScreenState extends State<CheckoutAmountScreen> {
  final LocalStorage my_storage = new LocalStorage('main');
  var amount;
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
                              "Enter the number of coins to be paid",
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
                                  onChanged: (value) {
                                    my_storage.setItem('amount', value);
                                    print('hello');
                                    print(value);
                                    setState(() {
                                      amount = value;
                                    });
                                    print(amount);
                                  },
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
                    Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 250),
                          type: PageTransitionType.bottomToTop,
                          child: CheckoutSecurityScreen()),
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
                          "Next",
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
