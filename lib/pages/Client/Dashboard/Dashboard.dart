import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shipment/pages/Client/Dashboard/PickUp.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;

  DateTime? selectedDate = DateTime.now();

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
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
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
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // setState(() {
                    //   exp = !exp;
                    // });
                  },
                  child: Container(
                    height: h,
                    width: exp ? w * 0.2 : w * 0.1,
                    color: Color(0xffFFFFFF),
                    child: exp
                        ? Column(
                            children: [
                              Container(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Image.asset(
                                                'assets/images/Ellipse7.png'),
                                            height: 48,
                                            width: 48),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 15),
                                                  child: Text("Shishank",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14,
                                                      )),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  child: Text(
                                                      "Shishank.barua@gmail.com",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                              InkWell(
                                onTap: () {
                                  // setState(() {
                                  //   openSUBMENU = !openSUBMENU;
                                  // });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Color(0xffFFFFFF)),
                                  height: MediaQuery.of(context).size.height *
                                      (8 / 100),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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
                                  setState(() {
                                    openSUBMENU = !openSUBMENU;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Color(0xffFFFFFF)),
                                  height: MediaQuery.of(context).size.height *
                                      (8 / 100),
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
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

                              Container(
                                // margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xffFFFFFF)),
                                height: MediaQuery.of(context).size.height *
                                    (8 / 100),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                              Container(
                                // margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xffFFFFFF)),
                                height: MediaQuery.of(context).size.height *
                                    (8 / 100),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                              Container(
                                // margin: EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Color(0xffFFFFFF)),
                                height: MediaQuery.of(context).size.height *
                                    (8 / 100),
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                  ),
                ),
                Container(
                  height: h,
                  width: exp ? w * 0.8 : w * 0.8,
                  color: Color(0xffE5E5E5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                            child: Text(
                              'Dashboard',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                            height: 35,
                            width:
                                MediaQuery.of(context).size.width * (10 / 100),
                            child: TextFormField(
                              initialValue: '',
                              onChanged: (value) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                              decoration: InputDecoration(
                                  fillColor: Color(0xffFFFFFF),
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1.2, color: Color(0xffFFFFFF)),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    // borderRadius: new BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        width: 1.2, color: Color(0xffFFFFFF)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.2, color: Color(0xffFFFFFF)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1.2, color: Color(0xffFFFFFF)),
                                  ),
                                  // border: InputBorder.none,
                                  hintText: "Search Here....",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: MediaQuery.of(context).size.height *
                                  (5 / 100),
                              // height: 100,
                              width: MediaQuery.of(context).size.width *
                                  (10 / 100),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "${selectedDate}".split(' ')[0],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectDate(context);
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
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            height: 52,
                            width:
                                MediaQuery.of(context).size.width * (18 / 100),
                            child: TextFormField(
                              initialValue: '',
                              onChanged: (value) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                              decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  // filled: true,

                                  // border: InputBorder.none,
                                  hintText: "From",
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15)),
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
                            width:
                                MediaQuery.of(context).size.width * (18 / 100),
                            child: TextFormField(
                              initialValue: '',
                              onChanged: (value) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
                              decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  // filled: true,

                                  // border: InputBorder.none,
                                  hintText: "To",
                                  hintStyle: TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 10, top: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffEEEEEE)),
                              height: 52,
                              // width: MediaQuery.of(context).size.width *
                              //     (40 / 100),
                              child: Image.asset(
                                'assets/images/dummy.png',
                              )),
                        ],
                      ),
                      ListView.builder(
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
                              color: Color(0xffFFFFFF),
                              margin:
                                  EdgeInsets.only(left: 24, top: 15, right: 10),
                              height: exp2 == index ? h * 0.3 : h * 0.13,
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
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    child: Text(
                                                        "MSC – Mediterranean Shipping Company")),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 15),
                                                  height: 50,
                                                  width: 50,
                                                  child: Image.asset(
                                                    'assets/images/ratings.png',
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15, top: 10),
                                                    child: Text(
                                                        "Departure date:")),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 15,
                                                        top: 10,
                                                        left: 5),
                                                    child: Text("21.08.2021")),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 45, top: 10),
                                                    child: Text(
                                                        "Total Container: ")),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, top: 10),
                                                    child: Text("10")),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Text(
                                                        "available Container:: ")),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 5, top: 10),
                                                    child: Text("4")),
                                                Spacer(),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15, top: 10),
                                                    child:
                                                        Text("Departure to:")),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 15,
                                                        top: 10,
                                                        left: 5),
                                                    child: Text("india")),
                                              ],
                                            ),
                                          ],
                                        )
                                      : Column(children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  height: 15,
                                                  width: 15,
                                                  child: ImageIcon(
                                                    AssetImage(
                                                      'assets/images/rightdropdown.png',
                                                    ),
                                                    size: 10,
                                                  )),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  child: Text(
                                                      "MSC – Mediterranean Shipping Company")),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 10),
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                  'assets/images/ratings.png',
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15, top: 5),
                                                  child:
                                                      Text("Departure date:")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15,
                                                      top: 5,
                                                      left: 5),
                                                  child: Text("21.08.2021")),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 45, top: 5),
                                                  child: Text(
                                                      "Total Container: ")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 10),
                                                  child: Text("10")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 5),
                                                  child: Text(
                                                      "available Container:: ")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Text("4")),
                                              Spacer(),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  child: Text("Departure to:")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15,
                                                      top: 10,
                                                      left: 5),
                                                  child: Text("india")),
                                            ],
                                          ),

                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 50, top: 10),
                                                child: Text("Availability")),
                                          ),

                                          Row(
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 45, top: 5),
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
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  child: Text("Cars")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      color: Color(0xffEFEFEF)),
                                                  child: Text("3")),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 5),
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
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 5),
                                                  child: Text("Boxes")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      color: Color(0xffEFEFEF)),
                                                  child: Text("5")),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 5),
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
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 5),
                                                  child: Text("Barrel")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                      color: Color(0xffEFEFEF)),
                                                  child: Text("12")),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 15, top: 5),
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
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 5),
                                                  child: Text("TV")),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 5, top: 5),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
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
                                                          Dash()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(top: 15),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: Colors.black),
                                              height: 35,
                                              width: 200,
                                              child: Center(
                                                child: Text("Submit",
                                                    style: TextStyle(
                                                        color: Colors.white)),
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
                      //       margin:
                      //           EdgeInsets.only(left: 24, top: 15, right: 10),
                      //       height: exp2 ? h * 0.2 : w * 0.07,
                      //       width: w,
                      //       child: Column(
                      //         children: [
                      //           !exp2
                      //               ? Column(
                      //                   children: [
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       children: [
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             height: 15,
                      //                             width: 15,
                      //                             child: ImageIcon(
                      //                               AssetImage(
                      //                                 'assets/images/rightdropdown.png',
                      //                               ),
                      //                               size: 10,
                      //                             )),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             child: Text(
                      //                                 "MSC – Mediterranean Shipping Company")),
                      //                         Container(
                      //                           margin: EdgeInsets.only(
                      //                               left: 15, top: 10),
                      //                           height: 50,
                      //                           width: 50,
                      //                           child: Image.asset(
                      //                             'assets/images/ratings.png',
                      //                           ),
                      //                         ),
                      //                         Spacer(),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             child:
                      //                                 Text("Departure date:")),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 right: 15,
                      //                                 top: 10,
                      //                                 left: 5),
                      //                             child: Text("21.08.2021")),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 5, top: 15),
                      //                             child: Text(
                      //                                 "Total Container: ")),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 15),
                      //                             child: Text("10")),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 )
                      //               : Column(
                      //                   children: [
                      //                     Row(
                      //                       mainAxisAlignment:
                      //                           MainAxisAlignment.start,
                      //                       children: [
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             height: 15,
                      //                             width: 15,
                      //                             child: ImageIcon(
                      //                               AssetImage(
                      //                                 'assets/images/rightdropdown.png',
                      //                               ),
                      //                               size: 10,
                      //                             )),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             child: Text(
                      //                                 "MSC – Mediterranean Shipping Company")),
                      //                         Container(
                      //                           margin: EdgeInsets.only(
                      //                               left: 15, top: 10),
                      //                           height: 50,
                      //                           width: 50,
                      //                           child: Image.asset(
                      //                             'assets/images/ratings.png',
                      //                           ),
                      //                         ),
                      //                         Spacer(),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 10),
                      //                             child:
                      //                                 Text("Departure date:")),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 right: 15,
                      //                                 top: 10,
                      //                                 left: 5),
                      //                             child: Text("21.08.2021")),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 5, top: 15),
                      //                             child: Text(
                      //                                 "Total Container: ")),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 15),
                      //                             child: Text("10")),
                      //                       ],
                      //                     ),
                      //                     Row(
                      //                       children: [
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 5, top: 15),
                      //                             child: Text(
                      //                                 "Total Container: ")),
                      //                         Container(
                      //                             margin: EdgeInsets.only(
                      //                                 left: 15, top: 15),
                      //                             child: Text("20")),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //         ],
                      //       )),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
