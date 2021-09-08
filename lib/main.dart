import 'package:flutter/material.dart';
import 'package:shipment/pages/LoginScreen.dart';
import 'package:shipment/pages/SignUpScreen.dart';
import 'package:shipment/pages/SignupShipment.dart';
import 'package:shipment/pages/Splash.dart';

void main() async {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
