import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import 'data.dart';

//For titles
class Header extends StatefulWidget {
  final String title; // receives the value
  Header({Key key, this.title}) : super(key: key);
  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
      child: Text(
        widget.title,
        style: GoogleFonts.karla(
            height: 3.2,
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Header(title: "Overview"),
            Dashboard(),
            Header(title: "Finances"),
            Header(title: "Transactions"),
            for (Transaction trans in transactions)
              Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Text(
                        trans.type,
                        style: GoogleFonts.karla(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      child: Text(
                        dateFormat.format(trans.dateAndTime).toString(),
                        style: GoogleFonts.karla(
                            fontSize: 11, color: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Text(
                        trans.amount.toString() + ' EBT',
                        style: GoogleFonts.karla(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(title: "EcoBlock", home: HomePage()));
}
