import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import 'main.dart';

class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                child: Buttons(),
              ),
            ),

            //Content of Deposit Screen
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height - 250, //guessed 200
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                color: Colors.white,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 5,
                    child: CloseButton(
                      onPressed: () {
                        //return to home
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Center(
                            child: Image.asset(
                              'images/expanded-logo.png',
                              width: MediaQuery.of(context).size.width - 140,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30, bottom: 10),
                            child: Text(
                              "To deposit, send EBT to your UID address listed below.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karla(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),

                        //UID
                        Container(
                          margin: EdgeInsets.only(top: 30, bottom: 10),
                          child: Text(
                            "Your UID",
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
                                child: Center(
                                  child: Text("123"),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.circular(8.0),
                                  color: Colors.grey[200],
                                ),
                              ),
                          ],
                        ),

                        //Got It button
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 42),
                            height: 40,
                            width: 140,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xff1AB08D),
                                ),
                                child: Center(
                                  child: Text(
                                    "GOT IT",
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
      ),
    );
  }
}
