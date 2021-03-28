import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import 'rest.dart';
<<<<<<< HEAD
import 'dart:convert';
import 'dart:io' as Io;
=======
>>>>>>> c3bb21b38d790a8268ea6444fa33844c12f4b6c5

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
                              onPressed: () {
<<<<<<< HEAD
                                // final bytes =
                                //     Io.File('images/expanded-logo.png')
                                //         .readAsBytesSync();
                                // print(bytes);
                                // String encoded = base64Encode(bytes);
=======
>>>>>>> c3bb21b38d790a8268ea6444fa33844c12f4b6c5
                                String encoded =
                                    "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";

                                createAlbum(encoded);
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
