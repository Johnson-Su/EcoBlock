import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'depositPage.dart';
import 'withdrawPage.dart';

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

//Control Deposit and Withdraw workflow
class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //Deposit and Withdraw buttons
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 9.0, left: 20.0),
          height: 45,
          width: 155,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DepositPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
                  "Deposit",
                  style: GoogleFonts.karla(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 9.0, right: 20.0),
          height: 45,
          width: 155,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      WithdrawPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(12.0),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1.0, 1.0),
                  colors: <Color>[Color(0xff1AB08D), Color(0xff50EE5E)],
                ),
              ),
              child: Center(
                child: Text(
                  "Withdraw",
                  style: GoogleFonts.karla(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
