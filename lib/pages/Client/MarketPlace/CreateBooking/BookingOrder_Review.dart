import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/demo.dart';
import 'package:shipment/Element/Responsive.dart';

import 'package:shipment/component/Res_Client/ResMarketPlace/Res_Booking_Des.dart';
import 'package:shipment/component/Res_Client/ResMarketPlace/Res_marketplace_details.dart';
import 'package:shipment/constants.dart';
import 'package:timelines/timelines.dart';
import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;

class BookingOrderReview extends StatefulWidget {
  const BookingOrderReview({Key? key}) : super(key: key);

  @override
  _BookingOrderReviewState createState() => _BookingOrderReviewState();
}

class _BookingOrderReviewState extends State<BookingOrderReview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  int _processIndex = 2;

  int? _radioValue = 0;
  int? _radioValue2 = 0;

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

                processTimeline5(),
                bookingReview(),
                // buttons(),
              ])),
        ));
  }

  Widget buttons() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.start,
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
                    builder: (context) => ResMarketPlacedetails()));
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

  Widget bookingReview() {
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
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xffACACAC)),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffE5E5E5),
                    ),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 15, top: 10),
                                width: 200,
                                child: Text(
                                  "Orders placed",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 15, top: 10, bottom: 10),
                                width: 200,
                                child: Text(
                                  "Oct 27, 2021",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Spacer(),
                        // SizedBox(
                        //   width: 70,
                        // ),
                        Column(
                          children: [
                            Container(
                                width: 200,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Total",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                width: 200,
                                child: Text(
                                  "227.00",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Container(
                                width: 400,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Ship To",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                width: 400,
                                child: Text(
                                  "Acme Corp, Stresemannstr. 70, Saarlouis, Germany",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Spacer(),

                        Column(
                          children: [
                            Container(
                                width: 200,
                                margin: EdgeInsets.only(right: 0, top: 10),
                                child: Text(
                                  "Order 12345",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Container(
                                width: 200,
                                margin: EdgeInsets.only(
                                    right: 0, top: 10, bottom: 10),
                                child: Text(
                                  "Order Details",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                            height: 150,
                            width: 300,
                            decoration: BoxDecoration(
                              // border: Border.all(

                              //     width: 0.5, color: Color(0xffACACAC)),
                              // borderRadius: BorderRadius.circular(0.0),
                              color: Color(0xffFFFFFF),
                            ),
                            margin:
                                EdgeInsets.only(top: 10, right: 10, left: 10),
                            child: Image.asset(
                              'assets/images/Cars.png',
                              fit: BoxFit.cover,
                            )),
                        secondRow(),
                        Spacer(),
                        thirdRow(),
                      ],
                    ),
                  ),
                  Container(
                      height: 80,
                      margin: EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Color(0xffACACAC)),
                        borderRadius: BorderRadius.circular(0.0),
                        color: Color(0xffE5E5E5),
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              width: 200,
                              child: Text(
                                "Estimated Delivery:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 5, top: 10),
                              width: 200,
                              child: Text(
                                "Oct 15,2021",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      )),
                  buttons(),
                ],
              ),
            );
          }),
    );
  }

  Widget processTimeline5() {
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
        ],
      ),
    );
  }

  Widget secondRow() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    "BMW Cars",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xffE6E7E8)),
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Center(
                    child: Text(
                      "Shipped on 12.11.19",
                      style: TextStyle(
                          color: Color(0xff1A494F),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              // Spacer(),
              //
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 15,
                    width: 15,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/car.png',
                      ),
                      size: 10,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text("Cars")),
                  Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(left: 10, top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xffEFEFEF)),
                      child: Center(child: Text("3"))),
                ]),
          ),
          Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              )),
        ],
      ),
    );
  }

  Widget thirdRow() {
    return Column(
      children: [
        Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Color(0xff1A494F)),
            margin: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Center(
              child: Text(
                "Accept",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
        Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(width: 0.5, color: Color(0xffACACAC)),
                color: Color(0xffFFFFFF)),
            margin: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Center(
              child: Text(
                "Reject",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
