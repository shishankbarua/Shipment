import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shipment/pages/Chhose%20Screen/ClientScreen.dart';
import 'package:shipment/pages/Chhose%20Screen/ShipmentScreen.dart';
import 'package:file_picker/file_picker.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _openCamera(BuildContext context) async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Text("Shipment",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold))),
                  Container(
                      margin: EdgeInsets.only(top: 61, left: 15),
                      child: Text("Welcome! to Shipment...",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 18,
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 17, left: 15),
                      child: Text("Choose your category",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 18,
                          ))),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ClientScreen()));

                      _openCamera(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 59),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xff1F2326)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),

                              // width: MediaQuery.of(context).size.width * 0.8,
                              // color: Colors.lime,
                              child: Center(
                                  child: Text("Sign in as client",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      )))),
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 10),
                            height: 20,
                            width: 20,
                            child: Image.asset('assets/images/arrow-right.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      log("\n\n\nTAPPED ON SHIPMENT\n\n\n");
                      Navigator.of(
                        context,
                      ).pushNamed(
                        Shipment.route,
                      );
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Shipment()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),

                              // width: MediaQuery.of(context).size.width * 0.8,
                              // color: Colors.lime,
                              child: Center(
                                  child: Text("Sign in as shipment",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      )))),
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 10),
                            height: 20,
                            width: 20,
                            child: Image.asset('assets/images/arrow-right.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))),
    ));
  }
}
