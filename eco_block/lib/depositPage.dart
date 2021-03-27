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
          ],
        ),
      ),
    );
  }
}
