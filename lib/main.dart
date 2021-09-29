import 'package:flutter/material.dart';
import 'package:shipment/pages/Client/Dashboard/CheckoutDash.dart';
import 'package:shipment/pages/Client/Dashboard/PickUp.dart';
import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
import 'package:shipment/pages/Client/Dashboard/GoodsInfo.dart';
import 'package:shipment/pages/Client/Dashboard/Payment.dart';
import 'package:shipment/pages/Client/Home.dart';
import 'package:shipment/pages/Client/Homepage.dart';

import 'package:shipment/pages/Client/LoginScreenClient.dart';
import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
import 'package:shipment/pages/Client/SignupScreenClient.dart';
import 'package:shipment/pages/Shipment/SignupShipment.dart';
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
