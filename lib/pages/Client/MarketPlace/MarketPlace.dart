import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
import 'package:shipment/pages/Client/Profile.dart';
import 'package:shipment/pages/Client/Transactions/Transactions.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  bool _value = false;
  int? val = -1;
  var h, w;
  var exp = true, openSUBMENU = false;

  Widget sideBar() {
    return Container(
      height: h,
      width: exp ? w * 0.2 : w * 0.1,
      color: Color(0xffFFFFFF),
      child: exp
          ? Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Color(0xffFFFFFF)),
                      // height: MediaQuery.of(context).size.height * 0.12,
                      height: 97,
                      width: 373,
                      // width: MediaQuery.of(context).size.width * 0.9,
                      // color: Colors.lime,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                child:
                                    Image.asset('assets/images/Ellipse7.png'),
                                height: 48,
                                width: 48),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      child: Text("Shishank",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          )),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text("Shishank.barua@gmail.com",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Dashboard()));
                    // setState(() {
                    //   openSUBMENU = !openSUBMENU;
                    // });
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffFFFFFF)),
                    height: MediaQuery.of(context).size.height * (8 / 100),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffEEEEEE)),
                            height: 15,
                            width: 15,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/dashboard.png',
                              ),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                                color: Color(0xff1A494F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              'assets/images/arrow-right.png',
                              color: Color(0xff1A494F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // openSUBMENU
                //     ? Container(
                //         height: 250,
                //         width: w * 0.2,
                //         color: Color(0xffE5E5E5),
                //       )
                //     : Container(),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MarketPlace()));
                    // setState(() {
                    //   openSUBMENU = !openSUBMENU;
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffFFFFFF)),
                    height: MediaQuery.of(context).size.height * (8 / 100),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffEEEEEE)),
                            height: 15,
                            width: 15,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/shipmentlistingicon.png',
                              ),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Market Place',
                            style: TextStyle(
                                color: Color(0xff1A494F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              'assets/images/arrow-right.png',
                              color: Color(0xff1A494F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    // setState(() {
                    //   openSUBMENU = !openSUBMENU;
                    // });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffFFFFFF)),
                    height: MediaQuery.of(context).size.height * (8 / 100),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffEEEEEE)),
                            height: 15,
                            width: 15,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/shipmentlistingicon.png',
                              ),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Booking',
                            style: TextStyle(
                                color: Color(0xff1A494F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              'assets/images/arrow-right.png',
                              color: Color(0xff1A494F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                // openSUBMENU
                //     ? Container(
                //         height: 150,
                //         width: w * 0.2,
                //         color: Color(0xffE5E5E5),

                //         child: Column(
                //           children: [

                //           ],
                //         ),
                //       )
                //     : Container(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Transactions()));
                  },
                  child: Container(
                    // margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Color(0xffFFFFFF)),
                    height: MediaQuery.of(context).size.height * (8 / 100),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffEEEEEE)),
                            height: 15,
                            width: 15,
                            child: ImageIcon(
                              AssetImage(
                                'assets/images/transicon.png',
                              ),
                              size: 10,
                            )),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Transactions',
                            style: TextStyle(
                                color: Color(0xff1A494F),
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Transactions()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            height: 15,
                            width: 15,
                            child: Image.asset(
                              'assets/images/arrow-right.png',
                              color: Color(0xff1A494F),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Color(0xffFFFFFF)),
                  height: MediaQuery.of(context).size.height * (8 / 100),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xffEEEEEE)),
                          height: 15,
                          width: 15,
                          child: ImageIcon(
                            AssetImage(
                              'assets/images/dashboard.png',
                            ),
                            size: 10,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text(
                          'Messages',
                          style: TextStyle(
                              color: Color(0xff1A494F),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => Profile()));
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 15,
                          width: 15,
                          child: Image.asset(
                            'assets/images/arrow-right.png',
                            color: Color(0xff1A494F),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffEEEEEE)),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/dashboard.png',
                      ),
                      size: 10,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffEEEEEE)),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/shipmentlistingicon.png',
                      ),
                      size: 10,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffEEEEEE)),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/transicon.png',
                      ),
                      size: 10,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xffEEEEEE)),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        'assets/images/dashboard.png',
                      ),
                      size: 10,
                    )),
              ],
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            height: h,
            width: w,
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 24, top: 15),
                height: 30,
                width: w,
                color: Color(0xffFFFFFF),
                child: Text("Shipment",
                    style: TextStyle(
                        color: Color(0xff1A494F),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Row(children: [
                InkWell(
                    onTap: () {
                      // setState(() {
                      //   exp = !exp;
                      // });
                    },
                    child: sideBar()),
                Container(
                    height: h,
                    width: exp ? w * 0.8 : w * 0.8,
                    color: Color(0xffE5E5E5),
                    // color: Colors.amber,
                    child: ListView(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: Text(
                                  'Market Place',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height *
                                    (45 / 100),
                                // height: 100,
                                width: MediaQuery.of(context).size.width *
                                    (80 / 100),
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
                                          margin: EdgeInsets.only(
                                              top: 15, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Booking",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        Spacer(),
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                color: Color(0xff1A494F)),
                                            margin: EdgeInsets.only(
                                                top: 15, right: 15),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                (6 / 100),
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width *
                                            //     (11 / 100),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 0, 0, 0),
                                                  child: Text(
                                                    "Create Booking",
                                                    style:
                                                        headingStylewhite14(),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      5, 0, 5, 0),
                                                  child: Icon(
                                                    Icons.add_box,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                )
                                              ],
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Approved (0)",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey))),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Under Review (0)",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey))),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("Draft (0)",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey))),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Divider(
                                        height: 30,
                                        color: Colors.black,
                                        thickness: 2,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 15, right: 50, left: 50),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Create a new project today to start promoting your services",
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff1A494F)))),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 15, bottom: 30),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              color: Colors.black),
                                          height: 45,
                                          width: 300,
                                          child: Center(
                                            child: Text("Create your booking",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(right: 10),
                                            height: 20,
                                            width: 20,
                                            child: Icon(Icons.arrow_right,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ))
              ]),
            ])));
  }
}
