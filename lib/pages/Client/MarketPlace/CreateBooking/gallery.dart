import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/demo.dart';
import 'package:shipment/Element/Responsive.dart';

import 'package:shipment/component/Res_Client/ResMarketPlace/Res_Booking_Des.dart';
import 'package:shipment/constants.dart';
import 'package:timelines/timelines.dart';
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  int _processIndex = 2;

  int? _radioValue = 0;
  int? _radioValue2 = 0;

  void _handleRadioValueChange2(value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: SideBar(),
        ),
        body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          color: Color(0xffF5F6F8),
          child: SafeArea(
              right: false,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Row(
                    children: [
                      if (!Responsive.isDesktop(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      // if (Responsive.isDesktop(context)) SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                        child: Text(
                          'Market Place > Project overview',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                processTimeline3(),
                gallary(),
                // buttons(),
              ])),
        ));
  }

  Widget buttons() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 100,
            height: 60,
            margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: Colors.black),
                color: Color(0xffFFFFFF)),
            child: Center(
                child: Text("Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ))),
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResBookingDescription()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xff1F2326)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 15),

                    // width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.lime,
                    child: Center(
                        child: Text("Save & Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            )))),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 30),
                  height: 30,
                  // width: 300,
                  child: Image.asset('assets/images/arrow-right.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget gallary() {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              // height: 80,
              width: w,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Create a stunning booking gallery",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Iteamt images",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Upload up to 20 images (.jpg or .png), up to 10MB each and less than 4000 pixels, in width or height.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffF5F6FA),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate,
                            color: Colors.black,
                            size: 40,
                          ),
                          Container(
                              // margin: EdgeInsets.only(left: 15, top: 10),
                              child: Text(
                            "Drag image here or browse",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color: Colors.grey),
                          )),
                        ],
                      ),
                    ),
                  ),
                  new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                  new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                  buttons(),
                ],
              ),
            );
          }),
    );
  }

  Widget processTimeline3() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              color: Color(0xff4CAF50),
            ),
            child: Container(
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Color(0xff4CAF50),
              thickness: 2,
              height: 36,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              color: Color(0xff4CAF50),
            ),
            child: Container(
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Color(0xff4CAF50),
              thickness: 2,
              height: 36,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff4CAF50)),
              // color: Color(0xff4CAF50),
            ),
            child: Container(
              child: Icon(
                Icons.edit,
                color: Color(0xff4CAF50),
                size: 20,
              ),
            ),
          ),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Color(0xff4CAF50),
              thickness: 2,
              height: 36,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              // color: Color(0xff4CAF50),
            ),
            child: Container(
                child: Center(
                    child: Text(
              '4',
              style: TextStyle(color: Colors.grey),
            ))),
          ),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              // color: Color(0xff4CAF50),
            ),
            child: Container(
                child: Center(
                    child: Text(
              '5',
              style: TextStyle(color: Colors.grey),
            ))),
          ),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey),
              // color: Color(0xff4CAF50),
            ),
            child: Container(
                child: Center(
                    child: Text(
              '6',
              style: TextStyle(color: Colors.grey),
            ))),
          ),
        ],
      ),
    );
  }
}
