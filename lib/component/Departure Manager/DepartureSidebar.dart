import 'package:flutter/material.dart';
import 'package:shipment/component/Departure%20Manager/ChatScreen.dart';
import 'package:shipment/component/Departure%20Manager/Dashboard/Dashboard.dart';
import 'package:shipment/component/Departure%20Manager/Dashboard/Order.dart';
import 'package:shipment/component/Departure%20Manager/Profile.dart';
import 'package:shipment/component/Departure%20Manager/Settings.dart';

class DepartureSidebar extends StatefulWidget {
  // DepartureSidebar({h}) ;

  @override
  _DepartureSidebarState createState() => _DepartureSidebarState();
}

class _DepartureSidebarState extends State<DepartureSidebar> {
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  int _selectedIndex = 0;
  double _animatedHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     Color(0xffFFFFFF),
          //     Color(0xffDCDEE1),
          //   ],
          // ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10,
              color: Colors.black,
              spreadRadius: 4,
            ),
          ],
          color: Color(0xffFFFFFF),
        ),
        child: Column(
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
                    color: Color(0xffFFFFFF),
                  ),
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
                            child: Image.asset('assets/images/Ellipse7.png'),
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xffFFFFFF)),
                height: MediaQuery.of(context).size.height * (5 / 100),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Row(
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
                            'Order',
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
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()));
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
            ),
            Container(
                // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
              color: Colors.grey,
              thickness: 2,
              height: 36,
            )),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DepSettings()));
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
                            'assets/images/dashboard.png',
                          ),
                          size: 10,
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        'Settings',
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
          ],
        ));
  }
}
