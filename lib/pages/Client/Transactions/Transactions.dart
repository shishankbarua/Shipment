import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
import 'package:shipment/pages/Client/Profile.dart';
import 'package:shipment/pages/Client/Transactions/AddnewCard.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
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
                                  'Transactions',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                  child: Text(
                                    'Save Cards',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddNewCard()));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: Color(0xff1A494F)),
                                      margin:
                                          EdgeInsets.only(top: 15, right: 15),
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              "Add New Card",
                                              style: headingStylewhite14(),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  (15 / 100),
                              width: MediaQuery.of(context).size.width *
                                  (80 / 100),
                              child: CupertinoScrollbar(
                                child: ListView.builder(
                                    // physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 15,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 15, right: 15),
                                          // decoration: BoxDecoration(
                                          //     borderRadius:
                                          //         BorderRadius.circular(15),
                                          //     color: Color(0xffFFFFFF)),
                                          // height:
                                          //     MediaQuery.of(context).size.height *
                                          //         (15 / 100),
                                          // width:
                                          //     MediaQuery.of(context).size.width *
                                          //         (20 / 100),
                                          child: Image.asset(
                                              'assets/images/card.png',
                                              height: 350,
                                              width: 250));
                                    }),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: Text(
                                  'Last Transactions',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: Text(
                                  'October 30, 2017',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 15, top: 20, right: 15),
                                    // decoration: BoxDecoration(
                                    //     borderRadius:
                                    //         BorderRadius.circular(15),
                                    //     color: Color(0xffFFFFFF)),
                                    height: MediaQuery.of(context).size.height *
                                        (5 / 100),
                                    width: MediaQuery.of(context).size.width *
                                        (2 / 100),
                                    child: Image.asset(
                                        'assets/images/cardPayment.png')),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                  child: Text(
                                    'Order #12456 Payment',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                    'Debit card',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                    'October 30, 2017',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: Text(
                                    '-667.00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        left: 15, top: 20, right: 15),
                                    // decoration: BoxDecoration(
                                    //     borderRadius:
                                    //         BorderRadius.circular(15),
                                    //     color: Color(0xffFFFFFF)),
                                    height: MediaQuery.of(context).size.height *
                                        (5 / 100),
                                    width: MediaQuery.of(context).size.width *
                                        (2 / 100),
                                    child: Image.asset(
                                        'assets/images/cardPayment.png')),
                                Container(
                                  margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                  child: Text(
                                    'Order #12456 Payment',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                    'Debit card',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Text(
                                    'October 30, 2017',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 20, 20, 0),
                                  child: Text(
                                    '-667.00',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Divider(
                                height: 30,
                                color: Colors.grey,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
              ]),
            ])));
  }
}
