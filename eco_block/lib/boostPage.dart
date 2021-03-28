import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

class BoostPage extends StatelessWidget {
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
              child: Dashboard(),
            ),
            AbsorbPointer(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.darken),
                child: Buttons(),
              ),
            ),

            //Content of EcoBoost Screen
            Container(
              margin: EdgeInsets.only(top: 50),
              height: MediaQuery.of(context).size.height - 200,
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
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Center(
                            child: Image.asset(
                              'images/boost-logo.png',
                              width: MediaQuery.of(context).size.width - 140,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30, bottom: 8),
                            child: Text(
                              "Increase your chance of winning a block by x1.5",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karla(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),

                        //UID
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30, bottom: 8),
                            child: Text(
                              "Take a photo of your energy bill and we will determine if you are eligible for EcoBoost.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.karla(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 65,
                            width: 220,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(0.0),
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(12.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(1.0, 1.0),
                                    colors: <Color>[
                                      Color(0xff1AB08D),
                                      Color(0xff50EE5E),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Take Photo",
                                    style: GoogleFonts.karla(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //Send button
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 40,
                            width: 140,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
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
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(1.0, 1.0),
                                    colors: <Color>[
                                      Color(0xff1AB08D),
                                      Color(0xff50EE5E),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "SEND",
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
