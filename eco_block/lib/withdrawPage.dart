import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'dashboard.dart';
import 'data.dart';

TextEditingController withdrawnController = new TextEditingController();

class WithdrawPage extends StatelessWidget {
  final balance = new ValueNotifier(user1.balance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<double>(
        valueListenable: balance,
        builder: (context, value, child) {
          return Container(
            color: Colors.grey,
            child: ListView(
              children: <Widget>[
                //all greyed out content
                ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                  child: Header(title: "Overview"),
                ),
                ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                  child: Dashboard(),
                ),
                AbsorbPointer(
                  child: ColorFiltered(
                    colorFilter:
                        ColorFilter.mode(Colors.grey, BlendMode.darken),
                    child: Buttons(),
                  ),
                ),

                //Content of Withdraw Screen
                Container(
                  margin: EdgeInsets.only(top: 50),
                  height:
                      MediaQuery.of(context).size.height - 220, //guessed 200
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        right: 5,
                        child: CloseButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        HomePage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: Center(
                                child: Image.asset(
                                  'images/expanded-logo.png',
                                  width:
                                      MediaQuery.of(context).size.width - 140,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                "Withdraw Amount",
                                style: GoogleFonts.karla(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            TextField(
                              controller: withdrawnController,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                labelText: 'COIN',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200]),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[200]),
                                ),
                              ),
                            ),

                            //UID
                            Container(
                              margin: EdgeInsets.only(top: 30, bottom: 10),
                              child: Text(
                                "UID",
                                style: GoogleFonts.karla(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < 3; i++) //3 containers
                                  Container(
                                    height: 30,
                                    width: 75,
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        filled: true,
                                        counterText: '',
                                        fillColor: Colors.grey[200],
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[200]),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey[200]),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            //Confirm button
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 42),
                                height: 40,
                                width: 140,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.all(0.0),
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            HomePage(),
                                      ),
                                    ); // navigates to homepage
                                    user1.balance -=
                                        double.parse(withdrawnController.text);
                                    balance.value = user1.balance;
                                  },
                                  child: Ink(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff1AB08D),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "CONFIRM",
                                        style: GoogleFonts.karla(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
