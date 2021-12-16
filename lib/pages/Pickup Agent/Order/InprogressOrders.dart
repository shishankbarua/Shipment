import 'package:flutter/material.dart';
import 'package:shipment/Element/CustomAlertDialog.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Pickup%20Agent/Pickup_Sidebar.dart';
import '../../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class inprogressOrders extends StatefulWidget {
  const inprogressOrders({Key? key}) : super(key: key);

  @override
  _inprogressOrdersState createState() => _inprogressOrdersState();
}

class _inprogressOrdersState extends State<inprogressOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? selectedDate = DateTime.now();
  var h, w;
  int? _radioValue = 0;
  String dropdownValue = 'One';

  String? category;

  var amount;
  var item = [
    'Select Status',
    'Picker',
    'Departed',
  ];
  final TextEditingController _controllr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: PickupSideBar(),
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
                          'Booking',
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
                      orderTemplate(),
                      orderDetails2(),
                      orderDetails2(),
                      orderDetails2(),
                    ],
                  ),

                if (!Responsive.isDesktop(context))
                  Column(
                    children: [
                      MobileVieworderTemplate(),
                      MobileVieworderTemplate(),
                      MobileVieworderTemplate(),
                      MobileVieworderTemplate(),
                    ],
                  ),

                // workingFlow(),

                // if (Responsive.isMobile(context))
                //   Column(
                //     children: [
                //       booking(),
                //       // workingFlow(),
                //     ],
                //   ),
                // if (Responsive.isTablet(context))
                //   Column(
                //     children: [
                //       booking(),
                //       // workingFlow(),
                //     ],
                //   ),
              ])),
        ));
  }

  Widget booking() {
    return Container(
        // height: (!Responsive.isDesktop(context))
        //     ? MediaQuery.of(context).size.height * (60 / 100)
        //     : MediaQuery.of(context).size.height * (45 / 100),
        height: 80,
        width: MediaQuery.of(context).size.width * (80 / 100),
        margin: EdgeInsets.all(15),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        //   color: Color(0xffFFFFFF),
        // ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("All Orders",
                          style: TextStyle(fontSize: 14, color: Colors.grey))),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text("Select Status",
                //           style: TextStyle(fontSize: 14, color: Colors.grey))),
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text("Draft (0)",
                //           style: TextStyle(fontSize: 14, color: Colors.grey))),
                // ),
                Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    height: MediaQuery.of(context).size.height * (5 / 100),
                    // height: 100,
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "Select Status",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    )),
                Spacer(),

                Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    height: MediaQuery.of(context).size.height * (5 / 100),
                    // height: 100,
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Export",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // _selectDate(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Image.asset(
                              'assets/images/Calendar.png',
                            ),
                          ),
                        )
                      ],
                    )),

                // Spacer(),
                Container(
                    margin: EdgeInsets.only(top: 15, right: 10),
                    height: MediaQuery.of(context).size.height * (5 / 100),
                    // height: 100,
                    width: MediaQuery.of(context).size.width * (10 / 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffFFFFFF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 10,
                          ),
                          child: Text(
                            "Print",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // _selectDate(context);
                          },
                          child: Container(
                            height: 25,
                            width: 25,
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Image.asset(
                              'assets/images/Calendar.png',
                            ),
                          ),
                        )
                      ],
                    )),
                // Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5.0),
                //         color: Color(0xff1A494F)),
                //     margin: EdgeInsets.only(top: 15, right: 15),
                //     height: MediaQuery.of(context).size.height * (5 / 100),
                //     // width: MediaQuery.of(context)
                //     //         .size
                //     //         .width *
                //     //     (11 / 100),
                //     child: Row(
                //       children: [
                //         Container(
                //           margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                //           child: Text(
                //             "Add Booking",
                //             style: headingStylewhite14(),
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                //           child: Icon(
                //             Icons.add_box,
                //             color: Colors.white,
                //             size: 20,
                //           ),
                //         )
                //       ],
                //     )),
              ],
            ),
            Row(
              children: [
                // Container(
                //   margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text("All Orders",
                //           style: TextStyle(fontSize: 14, color: Colors.grey))),
                // ),
                // Container(
                //   margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                //   child: Align(
                //       alignment: Alignment.topLeft,
                //       child: Text("Select Status",
                //           style: TextStyle(fontSize: 14, color: Colors.grey))),
                // ),
                // // Container(
                // //   margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                // //   child: Align(
                // //       alignment: Alignment.topLeft,
                // //       child: Text("Draft (0)",
                // //           style: TextStyle(fontSize: 14, color: Colors.grey))),
                // // ),

                // Container(
                //     margin: EdgeInsets.only(top: 15, right: 10),
                //     height: MediaQuery.of(context).size.height * (5 / 100),
                //     // height: 100,
                //     width: MediaQuery.of(context).size.width * (10 / 100),
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
                //             "Export",
                //             style: TextStyle(fontSize: 15),
                //           ),
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             // _selectDate(context);
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
          ],
        ));
  }

  Widget orderTemplate() {
    return Container(
      // height: (!Responsive.isDesktop(context))
      //     ? MediaQuery.of(context).size.height * (10 / 100)
      //     : MediaQuery.of(context).size.height * (45 / 100),
      height: 80,
      width: MediaQuery.of(context).size.width * (80 / 100),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),

      child: Row(
        children: [
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "Order ID",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(right: 30),
              child: Text(
                "Booking Date",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "Boat/ Plane / Roads",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(left: 50),
              child: Text(
                "From",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "To",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "Shipment Comapny",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.08,
              margin: EdgeInsets.only(right: 20),
              child: Text(
                "Upload Image",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  Widget orderDetails2() {
    return Container(
      // height: (!Responsive.isDesktop(context))
      //     ? MediaQuery.of(context).size.height * (10 / 100)
      //     : MediaQuery.of(context).size.height * (45 / 100),
      height: 150,
      width: MediaQuery.of(context).size.width * (80 / 100),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),

      child: Row(
        children: [
          Container(
              width: w * 0.10,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "12345",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "21.08.2021",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "Boat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "USA",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "India",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.06,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "CMA CGM",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
            // width: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xffE5E5E5)),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),

              // underline: Container(
              //   height: 2,
              //   color: Colors.redAccent,
              // ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Picked', 'Departed', 'Shipped', 'Waiting']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.home),
                    //   // color: Colors.redAccent,
                    // ),
                    Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(value)),
                  ]),
                );
              }).toList(),
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialogBox());
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  height: MediaQuery.of(context).size.height * (5 / 100),
                  // height: 100,
                  width: MediaQuery.of(context).size.width * (10 / 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff667C8A),
                  ),
                  child: Center(
                    child: Text(
                      "Upload image",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderDetails3() {
    return Container(
      // height: (!Responsive.isDesktop(context))
      //     ? MediaQuery.of(context).size.height * (10 / 100)
      //     : MediaQuery.of(context).size.height * (45 / 100),
      height: 150,
      width: MediaQuery.of(context).size.width * (80 / 100),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),

      child: Row(
        children: [
          Container(
              width: w * 0.10,
              margin: EdgeInsets.only(left: 15),
              child: Text(
                "12345",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "21.08.2021",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "Boat",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "USA",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.10,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "India",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          Container(
              width: w * 0.06,

              // margin: EdgeInsets.only(left: 20),
              child: Text(
                "CMA CGM",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          // Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialogBox());
            },
            child: Container(
                // margin: EdgeInsets.only(top: 25),
                height: MediaQuery.of(context).size.height * (5 / 100),
                // height: 100,
                width: MediaQuery.of(context).size.width * (10 / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // color: Color(0xff0FBAB8),
                ),
                child: Center(
                  child: Text(
                    "Waiting pickup",
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                )),
          ),
          // Spacer(),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => CustomDialogBox());
            },
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  // margin: EdgeInsets.only(top: 25, right: 10),
                  height: MediaQuery.of(context).size.height * (5 / 100),
                  // height: 100,
                  width: MediaQuery.of(context).size.width * (10 / 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff4CAF50),
                  ),
                  child: Center(
                    child: Text(
                      "Pick up",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget MobileVieworderTemplate() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            // height: (!Responsive.isDesktop(context))
            //     ? MediaQuery.of(context).size.height * (10 / 100)
            //     : MediaQuery.of(context).size.height * (45 / 100),
            height: MediaQuery.of(context).size.height * (60 / 100),
            width: w,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xffFFFFFF),
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "Order ID",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text(
                          "Status",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "123456 ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Waiting Pickup",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red))),
                  ],
                ),
                Container(
                    // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                  color: Colors.grey,
                  height: 36,
                )),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Booking Date",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Boat/ Plane / Roads",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "21.08.2021",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Boat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "Shipment Company",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text("from",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text("to",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "APM-Maersk.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("USA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("India",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "Pickup Review",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(left: 20, top: 10, right: 15),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff4CAF50),
                        ),
                        child: Center(
                          child: Text("pickup.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget MobileVieworderTemplate2() {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            // height: (!Responsive.isDesktop(context))
            //     ? MediaQuery.of(context).size.height * (10 / 100)
            //     : MediaQuery.of(context).size.height * (45 / 100),
            height: MediaQuery.of(context).size.height * (60 / 100),
            width: w,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xffFFFFFF),
            ),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "Order ID",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text(
                          "Status",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "123456 ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    // Container(
                    //     width: MediaQuery.of(context).size.width * (40 / 100),
                    //     margin: EdgeInsets.only(top: 10, right: 20),
                    //     child: Text("Waiting Pickup",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.red))),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                CustomDialogBox());
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(left: 15, top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xff0FBAB8),
                          ),
                          child: Center(
                            child: Text(
                              "Deliverd",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          )),
                    ),
                  ],
                ),
                Container(
                    // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                  color: Colors.grey,
                  height: 36,
                )),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "Booking Date",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Boat/ Plane / Roads",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "21.08.2021",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Boat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "Shipment Company",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text("from",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 15, right: 20),
                        child: Text("to",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          "APM-Maersk.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("USA",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                    Container(
                        width: MediaQuery.of(context).size.width * (20 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("India",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
