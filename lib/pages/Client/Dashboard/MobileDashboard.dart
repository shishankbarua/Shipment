import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Responsive.dart';
import 'package:shipment/component/Select_Pickup_Dropoff.dart';
import 'package:shipment/pages/Client/Dashboard/SelectReceptionist.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  _MobileDashboardState createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  int _selectedIndex = 0;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
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
          color: Color(0xffE5E5E5),
          child: SafeArea(
              right: false,
              child: Column(
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(left: 10),
                  //   // height: 30,
                  //   width: MediaQuery.of(context).size.width,
                  //   color: Color(0xffFFFFFF),
                  //   child: Text("Shipment",
                  //       style: TextStyle(
                  //           color: Color(0xff1A494F),
                  //           fontSize: 20,
                  //           fontWeight: FontWeight.bold)),
                  // ),
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
                        if (Responsive.isDesktop(context)) SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Spacer(),
                        // Container(
                        //   // margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                        //   height: 35,
                        //   width: MediaQuery.of(context).size.width * (10 / 100),
                        //   child: TextFormField(
                        //     initialValue: '',
                        //     onChanged: (value) {},
                        //     style:
                        //         TextStyle(color: Colors.black54, fontSize: 17),
                        //     decoration: InputDecoration(
                        //         fillColor: Color(0xffFFFFFF),
                        //         filled: true,
                        //         enabledBorder: OutlineInputBorder(
                        //           borderSide: BorderSide(
                        //               width: 1.5, color: Color(0xffFFFFFF)),
                        //         ),
                        //         focusedBorder: new OutlineInputBorder(
                        //           // borderRadius: new BorderRadius.circular(25.0),
                        //           borderSide: BorderSide(
                        //               width: 1.5, color: Color(0xffFFFFFF)),
                        //         ),
                        //         errorBorder: OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(10)),
                        //           borderSide: BorderSide(
                        //               width: 1.5, color: Color(0xffFFFFFF)),
                        //         ),
                        //         focusedErrorBorder: OutlineInputBorder(
                        //           borderRadius:
                        //               BorderRadius.all(Radius.circular(10)),
                        //           borderSide: BorderSide(
                        //               width: 1.5, color: Color(0xffFFFFFF)),
                        //         ),
                        //         // border: InputBorder.none,
                        //         hintText: "Search Here....",
                        //         hintStyle: TextStyle(
                        //             color: Colors.grey, fontSize: 10)),
                        //   ),
                        // ),
                        // Spacer(),
                        // Container(
                        //     margin: EdgeInsets.only(top: 15, right: 10),
                        //     height:
                        //         MediaQuery.of(context).size.height * (5 / 100),
                        //     // height: 100,
                        //     width:
                        //         MediaQuery.of(context).size.width * (10 / 100),
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10.0),
                        //       color: Color(0xffFFFFFF),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       children: [
                        //         Container(
                        //           margin: EdgeInsets.only(
                        //             left: 10,
                        //           ),
                        //           child: Text(
                        //             "${selectedDate}".split(' ')[0],
                        //             style: TextStyle(fontSize: 15),
                        //           ),
                        //         ),
                        //         GestureDetector(
                        //           onTap: () {
                        //             _selectDate(context);
                        //           },
                        //           child: Container(
                        //             height: 25,
                        //             width: 25,
                        //             margin: EdgeInsets.only(
                        //               right: 10,
                        //             ),
                        //             child: Image.asset(
                        //               'assets/images/Calendar.png',
                        //             ),
                        //           ),
                        //         )
                        //       ],
                        //     ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(25, 15, 0, 0),
                        height: 52,
                        width: MediaQuery.of(context).size.width * (25 / 100),
                        child: TextFormField(
                          initialValue: '',
                          onChanged: (value) {},
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              // filled: true,

                              // border: InputBorder.none,
                              hintText: "From",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15, top: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xffEEEEEE)),
                          height: 20,
                          width: 20,
                          child: ImageIcon(
                            AssetImage(
                              'assets/images/swap2.png',
                            ),
                            size: 10,
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                        height: 52,
                        width: MediaQuery.of(context).size.width * (25 / 100),
                        child: TextFormField(
                          initialValue: '',
                          onChanged: (value) {},
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              // filled: true,

                              // border: InputBorder.none,
                              hintText: "To",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ),
                      ),
                      // Container(
                      //     margin: EdgeInsets.only(left: 10, top: 15),
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         color: Color(0xffEEEEEE)),
                      //     height: 52,
                      //     // width: MediaQuery.of(context).size.width *
                      //     //     (40 / 100),
                      //     child: Image.asset(
                      //       'assets/images/dummy.png',
                      //     )),
                    ],
                  ),
                  if (Responsive.isMobile(context)) bookingMobileCard(),
                  if (Responsive.isDesktop(context)) bookingDesktopCard(),
                  if (Responsive.isTablet(context)) bookingDesktopCard(),
                ],
              ))),
    );
  }

  Widget bookingDesktopCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                exp2 = index;
                log("EXP2 >> $exp2");
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              margin: EdgeInsets.only(left: 24, top: 15, right: 10),
              height: exp2 == index ? h * 0.38 : h * 0.15,
              width: w,
              child: Column(
                children: [
                  exp2 != index
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 15,
                                  ),
                                  height: 15,
                                  width: 15,
                                  child: ImageIcon(
                                    AssetImage(
                                      'assets/images/rightdropdown.png',
                                    ),
                                    size: 10,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                        "MSC – Mediterranean Shipping Company",
                                        style: headingStyleNormal())),
                                // Container(
                                //   margin:
                                //       EdgeInsets.only(left: 15),
                                //   height: 50,
                                //   width: 50,
                                //   child: Image.asset(
                                //     'assets/images/ratings.png',
                                //   ),
                                // ),
                                Spacer(),
                                Container(
                                    margin: EdgeInsets.only(left: 15, top: 10),
                                    child: Text("Departure date:",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 15, top: 10, left: 5),
                                    child: Text("21.08.2021")),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 45, top: 10),
                                    child: Text("Total Container: ",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),
                                    child: Text("10")),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text("available Container:: ",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),
                                    child: Text("4")),
                                Spacer(),
                                Container(
                                    margin: EdgeInsets.only(left: 15, top: 10),
                                    child: Text("Departure to:",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 15, top: 10, left: 5),
                                    child: Text("india")),
                              ],
                            ),
                          ],
                        )
                      : Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  height: 15,
                                  width: 15,
                                  child: ImageIcon(
                                    AssetImage(
                                      'assets/images/rightdropdown.png',
                                    ),
                                    size: 10,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text(
                                      "MSC – Mediterranean Shipping Company",
                                      style: headingStyleNormal())),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 10),
                                height: 50,
                                width: 50,
                                child: Image.asset(
                                  'assets/images/ratings.png',
                                ),
                              ),
                              Spacer(),
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 5),
                                  child: Text("Departure date:",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 15, top: 5, left: 5),
                                  child: Text("21.08.2021")),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 45, top: 5),
                                  child: Text("Total Container: ",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text("10")),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("available Container:: ",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Text("4")),
                              Spacer(),
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text("Departure to:",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 15, top: 10, left: 5),
                                  child: Text("india")),
                            ],
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 50, top: 10),
                                child: Text("Availability",
                                    style: headingStyleBold())),
                          ),

                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 45, top: 5),
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
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("3")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
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
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("Boxes")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("5")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/barrel.png',
                                  ),
                                  size: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("Barrel")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("12")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/tv.png',
                                  ),
                                  size: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("TV")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("6")),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PickupDrop()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black),
                              height: 35,
                              width: 200,
                              child: Center(
                                child: Text("Book Now",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 4),
                          //   color: Colors.green,
                          //   height: 20,
                          //   width: 100,
                          // ),
                        ])
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bookingMobileCard() {
    return Expanded(
      child: ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                exp2 = index;
                log("EXP2 >> $exp2");
              });
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),
              margin: EdgeInsets.only(left: 20, top: 15, right: 10),
              height: exp2 == index ? h * 0.42 : h * 0.24,
              width: w,
              child: Column(
                children: [
                  exp2 != index
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 15, top: 15),
                                  height: 15,
                                  width: 15,
                                  child: ImageIcon(
                                    AssetImage(
                                      'assets/images/rightdropdown.png',
                                    ),
                                    size: 10,
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                        "MSC – Mediterranean Shipping Company",
                                        style: headingStyleNormal())),
                                // Container(
                                //   margin: EdgeInsets.only(left: 15),
                                //   height: 50,
                                //   width: 50,
                                //   child: Image.asset(
                                //     'assets/images/ratings.png',
                                //   ),
                                // ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 15, top: 10),
                                    child: Text("Departure date:",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 15, top: 10, left: 5),
                                    child: Text("21.08.2021")),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 15, top: 10),
                                    child: Text("Total Container: ",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),
                                    child: Text("10")),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 10),
                                    child: Text("available Container:: ",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(left: 5, top: 10),
                                    child: Text("4")),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 15, top: 10),
                                    child: Text("Departure to:",
                                        style: headingStyleNormal())),
                                Container(
                                    margin: EdgeInsets.only(
                                        right: 15, top: 10, left: 5),
                                    child: Text("india")),
                              ],
                            ),
                          ],
                        )
                      : Column(children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 15),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/rightdropdown.png',
                                  ),
                                  size: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 15),
                                  child: Text(
                                      "MSC – Mediterranean Shipping Company",
                                      style: headingStyleNormal())),
                              // Container(
                              //   margin: EdgeInsets.only(left: 15),
                              //   height: 50,
                              //   width: 50,
                              //   child: Image.asset(
                              //     'assets/images/ratings.png',
                              //   ),
                              // ),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text("Departure date:",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 15, top: 10, left: 5),
                                  child: Text("21.08.2021")),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text("Total Container: ",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text("10")),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text("available Container:: ",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 10),
                                  child: Text("4")),
                            ],
                          ),

                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 15, top: 10),
                                  child: Text("Departure to:",
                                      style: headingStyleNormal())),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: 15, top: 10, left: 5),
                                  child: Text("india")),
                            ],
                          ),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, top: 10),
                                child: Text("Availability",
                                    style: headingStyleBold())),
                          ),

                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
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
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("3")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
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
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("Boxes")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("5")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/barrel.png',
                                  ),
                                  size: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("Barrel")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("12")),
                              Container(
                                margin: EdgeInsets.only(left: 15, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/tv.png',
                                  ),
                                  size: 10,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text("TV")),
                              Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Color(0xffEFEFEF)),
                                  child: Text("6")),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SelectReceptionist()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 25),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black),
                              height: 35,
                              width: 200,
                              child: Center(
                                child: Text("Book Now",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(top: 4),
                          //   color: Colors.green,
                          //   height: 20,
                          //   width: 100,
                          // ),
                        ])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
