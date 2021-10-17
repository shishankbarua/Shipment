import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Responsive.dart';
import 'package:shipment/component/Made_Payment.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class PriceSummary extends StatefulWidget {
  const PriceSummary({Key? key}) : super(key: key);

  @override
  _PriceSummaryState createState() => _PriceSummaryState();
}

class _PriceSummaryState extends State<PriceSummary> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;

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
          color: Color(0xffE5E5E5),
          child: SafeArea(
              right: false,
              child: ListView(children: [
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
                          ' < Payment',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // height:
                          //     MediaQuery.of(context).size.height * (90 / 100),
                          // height: 100,
                          width: MediaQuery.of(context).size.width * (38 / 100),
                          child: orderDetails()),
                      Container(
                          // height:
                          //     MediaQuery.of(context).size.height * (90 / 100),
                          // height: 100,
                          width: MediaQuery.of(context).size.width * (38 / 100),
                          child: priceSummary())
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    children: [orderDetails(), priceSummary()],
                  ),
                if (Responsive.isTablet(context))
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            width:
                                MediaQuery.of(context).size.width * (80 / 100),
                            child: orderDetails()),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            width:
                                MediaQuery.of(context).size.width * (80 / 100),
                            child: priceSummary()),
                      )
                    ],
                  )
              ])),
        ));
  }

  Widget orderDetails() {
    return Column(
      children: [
        if (Responsive.isDesktop(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              height: MediaQuery.of(context).size.height * (51 / 100),
              // height: 100,
              width: MediaQuery.of(context).size.width * (38 / 100),

              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Orders",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              String.fromCharCodes(new Runes('\u0024')) + "667",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Image.asset(
                        'assets/images/Cars.png',
                      ))
                ],
              ),
            ),
          ),
        if (Responsive.isMobile(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              height: MediaQuery.of(context).size.height * (40 / 100),
              // height: 100,
              width: MediaQuery.of(context).size.width * (90 / 100),

              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Orders",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              String.fromCharCodes(new Runes('\u0024')) + "667",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Image.asset(
                        'assets/images/Cars.png',
                      ))
                ],
              ),
            ),
          ),
        if (Responsive.isTablet(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              height: MediaQuery.of(context).size.height * (40 / 100),
              // height: 100,
              width: MediaQuery.of(context).size.width * (90 / 100),

              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Orders",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              String.fromCharCodes(new Runes('\u0024')) + "667",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: Image.asset(
                        'assets/images/Cars.png',
                      ))
                ],
              ),
            ),
          ),
        Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Text(
              "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
              style: TextStyle(color: Colors.grey),
            )),
        if (Responsive.isDesktop(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff4CAF50)),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFFFFFF),
                ),
                height: MediaQuery.of(context).size.height * (15 / 100),
                // height: 100,
                width: MediaQuery.of(context).size.width * (38 / 100),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Pick up",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          right: 30,
                        ),
                        child: Align(
                            child: Text(
                          String.fromCharCodes(new Runes('\u0024')) + "50.00",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 15),
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
                        margin: EdgeInsets.only(left: 5, top: 15),
                        child: Text("Cars")),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("3")),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      height: 15,
                      width: 15,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/box.png',
                        ),
                        size: 10,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text("Boxes")),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("5"))
                  ])
                ])),
          ),
        if (Responsive.isMobile(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff4CAF50)),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFFFFFF),
                ),
                height: MediaQuery.of(context).size.height * (15 / 100),
                // height: 100,
                width: MediaQuery.of(context).size.width * (90 / 100),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, right: 10, left: 15, bottom: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Drop off",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          right: 30,
                        ),
                        child: Align(
                            child: Text(
                          String.fromCharCodes(new Runes('\u0024')) + "50.00",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 15),
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
                        margin: EdgeInsets.only(left: 5, top: 15),
                        child: Text("Cars")),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("3")),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      height: 15,
                      width: 15,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/box.png',
                        ),
                        size: 10,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text("Boxes")),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("5"))
                  ])
                ])),
          ),
        if (Responsive.isTablet(context))
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff4CAF50)),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xffFFFFFF),
                ),
                height: MediaQuery.of(context).size.height * (15 / 100),
                // height: 100,
                width: MediaQuery.of(context).size.width * (80 / 100),
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 10, right: 10, left: 15, bottom: 20),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Drop off",
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          right: 30,
                        ),
                        child: Align(
                            child: Text(
                          String.fromCharCodes(new Runes('\u0024')) + "50.00",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        )),
                      ),
                    ],
                  ),
                  Row(children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 15),
                      height: 10,
                      width: 10,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/car.png',
                        ),
                        size: 10,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 15),
                        child: Text("Cars")),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("3")),
                    Container(
                      margin: EdgeInsets.only(left: 15, top: 15),
                      height: 15,
                      width: 15,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/box.png',
                        ),
                        size: 10,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        child: Text("Boxes")),
                    Container(
                        margin: EdgeInsets.only(left: 5, top: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xffEFEFEF)),
                        child: Text("5"))
                  ])
                ])),
          )
      ],
    );
  }

  Widget priceSummary() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        height: MediaQuery.of(context).size.height * (80 / 100),
        // height: 100,
        width: (Responsive.isDesktop(context))
            ? MediaQuery.of(context).size.width * (38 / 100)
            : MediaQuery.of(context).size.width * (90 / 100),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, right: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Price summary",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 30,
                color: Colors.black,
                thickness: 2,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Item 1",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "BMW Cars",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "QTY",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "3",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Car Price",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "210.00",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Item 2",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    "Boxes",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "QTY",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "4",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Box Price",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "210.00",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Pick Up fee",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "17",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shiping Fee",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "250",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Total Price",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "687",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Amet minim mollit non deserunt ullamco.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "-40.00",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Amet minim mollit non deserunt ullamco.",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  )),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Tax",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "20.00",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Divider(
                height: 30,
                color: Colors.black,
                thickness: 2,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Total Amount",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      )),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 30,
                  ),
                  child: Align(
                      child: Text(
                    String.fromCharCodes(new Runes('\u0024')) + "667.00",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MakePayment()));
              },
              child: Container(
                margin:
                    EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.black),
                height: MediaQuery.of(context).size.height * (7 / 100),
                width: 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Check Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 20,
                      width: 20,
                      child: Image.asset('assets/images/arrow-right.png'),
                    )
                  ],
                ),
              ),

              // Container(
              //   margin:
              //       EdgeInsets.only(top: 15, bottom: 70),
              //   decoration: BoxDecoration(
              //       borderRadius:
              //           BorderRadius.circular(20.0),
              //       color: Colors.black),
              //   height: 45,
              //   width: 300,
              //   child: Center(
              //     child: Text("Check out",
              //         style:
              //             TextStyle(color: Colors.white)),
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
