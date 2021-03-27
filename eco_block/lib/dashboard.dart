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
      margin: EdgeInsets.only(left:30.0, top:32.0, right:30.0, bottom:5.0),
      height: 180,
      width: 315,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.6, 0.9),
          colors: <Color>[Color(0xff1ab08d), Color(0xff50EE5E)],
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 24,
            left: 24,
            child: Text(
              user1.name,
              style: GoogleFonts.karla(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: 24,
            right: 24,
            child: Container(
              child: Image.asset('images/logo.png', height: 50, width: 50),
            ),
          ),
          Positioned(
            top: 48,
            left: 24,
            child: Text(
              "UID: " + user1.UID,
              style: GoogleFonts.karla(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Positioned(
            bottom: 58,
            left: 24,
            child: Text(
              "BALANCE",
              style: GoogleFonts.karla(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.8)),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top:122, left: 24),
                child: Text(
                  balanceFormat.format(user1.balance).toString(),
                  style: GoogleFonts.karla(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 128, left: 4),
                child: Text(
                  "COIN",
                  style: GoogleFonts.karla(
                      fontSize: 18,
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
          margin: EdgeInsets.only(top: 24.0, left: 30.0),
          height: 45,
          width: 150,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      DepositPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff1ab08d)
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
          margin: EdgeInsets.only(top: 24.0, right: 30.0),
          height: 45,
          width: 150,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      WithdrawPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff50EE5E),
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
