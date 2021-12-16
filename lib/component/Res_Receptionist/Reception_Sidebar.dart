import 'package:flutter/material.dart';
import 'package:shipment/component/Res_Receptionist/Message.dart';
import 'package:shipment/component/Res_Receptionist/Res_Booking.dart';
import 'package:shipment/component/Res_Receptionist/Res_Profile.dart';
import 'package:shipment/component/Res_Receptionist/Res_Setting_Rece.dart';
import 'package:shipment/pages/Receptionist/Bookings/Bookings.dart';

class ReceptionSidebar extends StatefulWidget {
  const ReceptionSidebar({Key? key}) : super(key: key);

  @override
  _ReceptionSidebarState createState() => _ReceptionSidebarState();
}

class _ReceptionSidebarState extends State<ReceptionSidebar> {
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: h,
        // width: exp ? w * 0.2 : w * 0.1,
        color: Color(0xffFFFFFF),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResProfile()));
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
                    MaterialPageRoute(builder: (context) => ResBookings()));
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
                        'Bookings',
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
                    MaterialPageRoute(builder: (context) => Message()));
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
                    MaterialPageRoute(builder: (context) => ResSettings()));
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
