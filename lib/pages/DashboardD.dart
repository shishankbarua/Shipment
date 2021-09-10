import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:side_navigation/api/side_navigation_bar.dart';
import 'package:side_navigation/api/side_navigation_bar_item.dart';

class DashBoard2 extends StatefulWidget {
  const DashBoard2({Key key}) : super(key: key);

  @override
  _DashBoard2State createState() => _DashBoard2State();
}

class _DashBoard2State extends State<DashBoard2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Shipment",
            style: TextStyle(color: Color(0xff1A494F)),
          ),
        ),
        body: Column(
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(15.0),
                      color: Colors.green),
                  child: Column(
                    children: [
                      Text("Messages",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 50,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(15.0),
                        color: Colors.blue),
                    child: Column(
                      children: [
                        Text("Messages",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
