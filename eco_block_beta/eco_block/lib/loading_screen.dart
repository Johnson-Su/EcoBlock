import 'package:eco_block/dashboard.dart';
import 'package:eco_block/firebase_service.dart';
import 'package:eco_block/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final FirebaseService firebaseService = FirebaseService();

  Map<String, dynamic> data;

  void getData() async {
    data = await firebaseService.fetchData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          data: data,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
