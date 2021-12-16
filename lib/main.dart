import 'package:flutter/material.dart';
import 'package:shipment/pages/Chhose%20Screen/ShipmentScreen.dart';
import 'package:shipment/pages/Shipment/LoginSignUp/SignupShipmentfirst.dart';
import 'package:shipment/pages/Splash.dart';

void main() async {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: {
        // MyApp.route: (context) => MyApp(),
        Shipment.route: (context) => Shipment(),
        SplashScreen.route: (context) => SplashScreen(),
        SignupScreenfirst.route: (context) => SignupScreenfirst(),
      },
      // home: SplashScreen(),
    ),
  );
}

// class MyApp extends StatefulWidget {
//   static const route = '/';
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen();
//   }
// }
