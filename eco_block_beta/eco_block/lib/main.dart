import 'package:eco_block/firebase_service.dart';
import 'package:eco_block/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';
import 'data.dart';
import 'package:fl_chart/fl_chart.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
      child: Text(
        widget.title,
        style: GoogleFonts.karla(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  Map<String, dynamic> data;

  HomePage({this.data});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.cached),
        backgroundColor: Color(0xff50EE5E),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoadingScreen(),
            ),
          );
        },
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Dashboard(
              fName: widget.data["first"],
              lName: widget.data["last"],
              balance: widget.data["balance"],
            ),
            Buttons(),
            Header(title: "Finances"),
            //Graph
            Container(
              height: 180,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: LineChart(sampleData())),
            ),
            Header(title: "Transactions"),
            for (Transaction trans in transactions)
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xffC6C6C6)),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Text(
                        trans.type,
                        style: GoogleFonts.karla(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      child: Text(
                        dateFormat.format(trans.dateAndTime).toString(),
                        style: GoogleFonts.karla(
                            fontSize: 12, color: Color(0xff707070)),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: Text(
                        trans.amount.toString(),
                        style: GoogleFonts.karla(
                            fontSize: 14,
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
  asyncRunApp();
}

void asyncRunApp() async {
  await Firebase.initializeApp();
  runApp(new MaterialApp(title: "EcoBlock", home: LoadingScreen()));
}
