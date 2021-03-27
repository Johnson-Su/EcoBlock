import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

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
