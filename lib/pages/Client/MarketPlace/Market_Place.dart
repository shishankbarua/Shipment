import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Client/ResMarketPlace/Res_BookingOverView.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;
  int? _radioValue = 0;

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
                          'Market Place',
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
                  Column(
                    children: [
                      booking(),
                      workingFlow(),
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    children: [
                      booking(),
                      workingFlow(),
                    ],
                  ),
                if (Responsive.isTablet(context))
                  Column(
                    children: [
                      booking(),
                      workingFlow(),
                    ],
                  ),
              ])),
        ));
  }

  Widget booking() {
    return Container(
        height: (!Responsive.isDesktop(context))
            ? MediaQuery.of(context).size.height * (60 / 100)
            : MediaQuery.of(context).size.height * (45 / 100),
        // height: 100,
        width: MediaQuery.of(context).size.width * (80 / 100),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Booking",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResBookingOverView()));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff1A494F)),
                      margin: EdgeInsets.only(top: 15, right: 15),
                      height: MediaQuery.of(context).size.height * (6 / 100),
                      // width: MediaQuery.of(context)
                      //         .size
                      //         .width *
                      //     (11 / 100),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Create Booking",
                              style: headingStylewhite14(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Icon(
                              Icons.add_box,
                              color: Colors.white,
                              size: 20,
                            ),
                          )
                        ],
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
                      child: Text("Approved (0)",
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Under Review (0)",
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Draft (0)",
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
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
            Container(
              margin: EdgeInsets.only(top: 15, right: 50, left: 50),
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      "Create a new project today to start promoting your services",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A494F)))),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResBookingOverView()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 15, bottom: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black),
                    height: 45,
                    width: 300,
                    child: Center(
                      child: Text("Create your booking",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 20,
                      width: 20,
                      child: Icon(Icons.arrow_right, color: Colors.white)),
                ],
              ),
            ),
          ],
        ));
  }

  Widget workingFlow() {
    return Container(
        height: MediaQuery.of(context).size.height * (55 / 100),
        // height: 100,
        width: MediaQuery.of(context).size.width * (80 / 100),
        margin: EdgeInsets.fromLTRB(15, 15, 15, 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15, right: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "How Booking Market Place worksg",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * (7 / 100),
              // width: MediaQuery.of(context).size.width * (7 / 100),
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
                    height: MediaQuery.of(context).size.height * (15 / 100),
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height:
                              MediaQuery.of(context).size.height * (15 / 100),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xffA9CCD0)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text("1. Get an order"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 35),
                          // width: MediaQuery.of(context).size.width * (10 / 100),
                          child: Text(
                              "You can start communicating via Shipment Messages."),
                        )
                      ],
                    )),
                Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height * (15 / 100),
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            height:
                                MediaQuery.of(context).size.height * (15 / 100),
                            width:
                                MediaQuery.of(context).size.width * (10 / 100),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xffA9CCD0)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 35),
                          child: Text("2. Wait for requirements"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 35),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          child: Text(
                              "The client has 48 hours to send these, or the project is canceled."),
                        )
                      ],
                    )),
                Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height * (15 / 100),
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          height:
                              MediaQuery.of(context).size.height * (15 / 100),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xffA9CCD0)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 35),
                            child: Text("3. Send work by deadline"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 35),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          child: Text(
                              "The clock starts once you receive the requirements."),
                        )
                      ],
                    )),
                Spacer(),
                Container(
                    height: MediaQuery.of(context).size.height * (15 / 100),
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      children: [
                        Container(
                          height:
                              MediaQuery.of(context).size.height * (15 / 100),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(50.0),
                              color: Color(0xffA9CCD0)),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 35),
                            child: Text("4. Get Paid"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 35),
                          width: MediaQuery.of(context).size.width * (10 / 100),
                          child: Text(
                              "Complete revisions for final approval. You receive payment and the contract ends."),
                        )
                      ],
                    )),
              ],
            )
          ],
        ));
  }
}
