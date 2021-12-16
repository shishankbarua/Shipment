import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/demo.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Client/ResMarketPlace/Res_pricing.dart';
import 'package:shipment/constants.dart';
import 'package:timelines/timelines.dart';
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;

class BookingOverView extends StatefulWidget {
  const BookingOverView({Key? key}) : super(key: key);

  @override
  _BookingOverViewState createState() => _BookingOverViewState();
}

class _BookingOverViewState extends State<BookingOverView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  int _processIndex = 2;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  int? _radioValue = 0;
  int? _radioValue2 = 0;

  void _handleRadioValueChange(value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  void _handleRadioValueChange2(value) {
    setState(() {
      _radioValue2 = value;

      switch (_radioValue2) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
        case 3:
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

                processTimeline(),
                bookingOverView(),
                // buttons(),
              ])),
        ));
  }

  Widget bookingOverView() {
    return Expanded(
      child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              // height: 80,
              width: w,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 20),
                        child: Text(
                          "Booking overview",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 36,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Title",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tell the client what you will deliver and how it benefits them.",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                      // width: MediaQuery.of(context).size.width * (15 / 100),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (v) {
                          setState(() {
                            // userEmail = v.toLowerCase();
                          });
                        },
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        decoration: InputDecoration(
                            fillColor: Color(0xffF5F6FA),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            // border: InputBorder.none,
                            hintText: "you will get",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Some good example titles",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "• You will get an amazing logo designed for your business",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "• You will get 3 hours of social media marketing consultation",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "• You will get a revamped resume tailored to your next job",
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
                          "Category",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Select a category so it's easy for clients to find your project.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Here are some suggestions based on your Booking title.",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )),
                  ),
                  // GridView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: 1,
                  //     shrinkWrap: true,
                  //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3,
                  //       childAspectRatio: MediaQuery.of(context).size.width /
                  //           (MediaQuery.of(context).size.height / 5),
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       return
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height * (10 / 100),
                      // height: 100,
                      // width: MediaQuery.of(context).size.width * (90 / 100),
                      // margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffFFFFFF),
                      ),

                      child: Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 15),
                            height: 20,
                            width: 20,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/car.png',
                              ),
                              size: 20,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Cars",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 15, top: 5),
                            height: 20,
                            width: 20,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/box.png',
                              ),
                              size: 20,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("Boxes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                          new Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                          Container(
                            // margin: EdgeInsets.only(left: 15, top: 5),
                            height: 20,
                            width: 20,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/barrel.png',
                              ),
                              size: 20,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("Barrel",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                          // new Radio(
                          //   value: 3,
                          //   groupValue: _radioValue,
                          //   onChanged: _handleRadioValueChange,
                          // ),
                          // Container(
                          //   // margin: EdgeInsets.only(left: 15, top: 5),
                          //   height: 20,
                          //   width: 20,
                          //   child: ImageIcon(
                          //     AssetImage(
                          //       'assets/images/tv.png',
                          //     ),
                          //     size: 20,
                          //   ),
                          // ),
                          // Container(
                          //     // margin: EdgeInsets.only(left: 10, top: 5),
                          //     child: Text("TV",
                          //         style: TextStyle(
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            "Not seeing the right fit?",
                            style: TextStyle(color: Color(0xffC4C4C4)),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Browse all categories",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1A494F)),
                          )),
                    ],
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
                          "Booking attributes",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Car type (Optional)",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Choose up to 3",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        )),
                  ),
                  // GridView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     scrollDirection: Axis.vertical,
                  //     itemCount: 1,
                  //     shrinkWrap: true,
                  //     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3,
                  //       childAspectRatio: MediaQuery.of(context).size.width /
                  //           (MediaQuery.of(context).size.height / 5),
                  //     ),
                  //     itemBuilder: (context, index) {
                  //       return
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: MediaQuery.of(context).size.height * (10 / 100),
                      // height: 100,
                      // width: MediaQuery.of(context).size.width * (90 / 100),
                      // margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffFFFFFF),
                      ),

                      child: Row(
                        children: [
                          new Radio(
                            value: 0,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Small Cars",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("Sedan Car",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                          new Radio(
                            value: 2,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("TUV Cars",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
                          new Radio(
                            value: 3,
                            groupValue: _radioValue2,
                            onChanged: _handleRadioValueChange2,
                          ),
                          Container(
                              // margin: EdgeInsets.only(left: 10, top: 5),
                              child: Text("XUV Cars",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))),
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

                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text(
                          "Pick-up and Drop-off Location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          "Car type (Optional)",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        )),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Pick-up Location",
                          style: TextStyle(fontSize: 14),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                    // width: MediaQuery.of(context).size.width * (15 / 100),
                    child: TextFormField(
                      initialValue: "",
                      onChanged: (v) {
                        setState(() {
                          // userEmail = v.toLowerCase();
                        });
                      },
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                      decoration: InputDecoration(
                          fillColor: Color(0xffF5F6FA),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            // borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          // border: InputBorder.none,
                          hintText:
                              "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Drop-off Location",
                          style: TextStyle(fontSize: 14),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                    // width: MediaQuery.of(context).size.width * (15 / 100),
                    child: TextFormField(
                      initialValue: "",
                      onChanged: (v) {
                        setState(() {
                          // userEmail = v.toLowerCase();
                        });
                      },
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                      decoration: InputDecoration(
                          fillColor: Color(0xffF5F6FA),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            // borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffF5F6FA)),
                          ),
                          // border: InputBorder.none,
                          hintText:
                              "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                  buttons(),
                ],
              ),
            );
          }),
    );
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
                context, MaterialPageRoute(builder: (context) => ResPricing()));
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

  Widget processTimeline() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
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
            Container(
              margin: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Overview",
                style: TextStyle(color: Color(0xff4CAF50)),
              ),
            )
          ]),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Color(0xff4CAF50),
              thickness: 2,
              height: 36,
            )),
          ),
          Column(children: [
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
                '2',
                style: TextStyle(color: Colors.grey),
              ))),
              // Container(
              // margin: EdgeInsets.only(left: 15, top: 1),
              // child: Center(
              //     child: Text(
              //   'Pricing',
              //   style: TextStyle(color: Colors.grey),
              // ))),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Pricing",
                style: TextStyle(color: Colors.grey),
              ),
            )
          ]),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Column(children: [
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
                '3',
                style: TextStyle(color: Colors.grey),
              ))),
            ),
            Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: Center(
                    child: Text(
                  'Gallery',
                  style: TextStyle(color: Colors.grey),
                ))),
          ]),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Column(children: [
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
            Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: Center(
                    child: Text(
                  'Description',
                  style: TextStyle(color: Colors.grey),
                ))),
          ]),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Column(children: [
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
            Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                child: Center(
                    child: Text(
                  'Requirement',
                  style: TextStyle(color: Colors.grey),
                ))),
          ]),
          Expanded(
            child: Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
          ),
          Column(children: [
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
            Container(
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Center(
                    child: Text(
                  'Review',
                  style: TextStyle(color: Colors.grey),
                ))),
          ]),
        ],
      ),
    );
  }
}
