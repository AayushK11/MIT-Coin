import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mit_coin_app/Screens/success_massage.dart';
import 'package:page_transition/page_transition.dart';

class CheckoutSecurityScreen extends StatefulWidget {
  const CheckoutSecurityScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutSecurityScreen> createState() => _CheckoutSecurityScreenState();
}

class _CheckoutSecurityScreenState extends State<CheckoutSecurityScreen> {
  final LocalStorage my_storage = new LocalStorage('main');

  Future<void> makeGetRequest() async {
    final baseURL = 'http://dcb5-114-143-215-162.ngrok.io/';
    final sender = my_storage.getItem('wallet_link');
    final receiver = my_storage.getItem('receiver');
    final amount = my_storage.getItem('amount');
    final url = Uri.parse('$baseURL/transact/$sender/$receiver/$amount');
    Response response = await get(url);
    print('Status code: ${response.statusCode}');
    print('Headers: ${response.headers}');
    print('Body: ${response.body}');
  }

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
                              "Enter Password to complete transaction",
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
                    makeGetRequest();
                    Navigator.push(
                      context,
                      PageTransition(
                          duration: Duration(milliseconds: 250),
                          type: PageTransitionType.bottomToTop,
                          child: SuccessScreen()),
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
                          "Pay 15 Coins",
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
