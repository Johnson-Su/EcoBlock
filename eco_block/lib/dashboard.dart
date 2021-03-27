import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';

final balanceFormat = new NumberFormat("#,##0.00", "en_US");

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      height: 145,
      width: 335,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.6, 0.9),
          colors: <Color>[Color(0xff1ab08d), Color(0xff50EE5E)],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              user1.name,
              style: GoogleFonts.karla(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              child: Image.asset('images/logo.png', height: 50, width: 50),
            ),
          ),
          Positioned(
            top: 38,
            left: 20,
            child: Text(
              "UID: " + user1.UID,
              style: GoogleFonts.karla(fontSize: 12, color: Colors.white),
            ),
          ),
          Positioned(
            top: 73,
            left: 20,
            child: Text(
              "BALANCE",
              style: GoogleFonts.karla(fontSize: 12, color: Colors.white),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 90, left: 20),
                child: Text(
                  balanceFormat.format(user1.balance).toString(),
                  style: GoogleFonts.karla(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 98, left: 3),
                child: Text(
                  "COIN",
                  style: GoogleFonts.karla(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
