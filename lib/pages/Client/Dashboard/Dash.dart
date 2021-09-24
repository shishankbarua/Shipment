import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shipment/pages/Client/Dashboard/GoodsInfo.dart';

class Dash extends StatefulWidget {
  const Dash({Key? key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  bool _value = false;
  int? val = -1;
  var h, w;
  var exp = false, openSUBMENU = false;
  var exp2 = -1;
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
                    setState(() {
                      exp = !exp;
                    });
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
                                          'Shipment Listing',
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
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: Text(
                                  'Dashboard > Cosco >Pickup / Drop Off',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                                height: 52,
                                width: MediaQuery.of(context).size.width *
                                    (10 / 100),
                                child: TextFormField(
                                  initialValue: '',
                                  onChanged: (value) {},
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 17),
                                  decoration: InputDecoration(
                                      fillColor: Color(0xffFFFFFF),
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        // borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      // border: InputBorder.none,
                                      hintText: "Search Here....",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                                height: 35,
                                width: MediaQuery.of(context).size.width *
                                    (10 / 100),
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
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
                                        // borderRadius: new BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffFFFFFF)),
                                      ),
                                      // border: InputBorder.none,
                                      hintText: "Search Here....",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffFFFFFF),
                                ),
                                height: MediaQuery.of(context).size.height *
                                    (60 / 100),
                                // height: 100,
                                width: MediaQuery.of(context).size.width *
                                    (32 / 100),

                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 10, right: 10, left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Receptionist information",
                                            style: TextStyle(fontSize: 20),
                                          )),
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
                                          top: 5, right: 10, left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Name",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      child: TextFormField(
                                        initialValue: "",
                                        onChanged: (v) {
                                          setState(() {
                                            // userEmail = v.toLowerCase();
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffF5F6FA),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              // borderRadius: new BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            // border: InputBorder.none,
                                            hintText: "Shishank Barua",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Email address",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      width: MediaQuery.of(context).size.width *
                                          (50 / 100),
                                      child: TextFormField(
                                        initialValue: "",
                                        onChanged: (v) {
                                          setState(() {
                                            // userEmail = v.toLowerCase();
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffF5F6FA),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              // borderRadius: new BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            // border: InputBorder.none,
                                            hintText:
                                                "Shishank.Barua@gamil.com",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Contact number",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      width: MediaQuery.of(context).size.width *
                                          (50 / 100),
                                      child: TextFormField(
                                        initialValue: "",
                                        onChanged: (v) {
                                          setState(() {
                                            // userEmail = v.toLowerCase();
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffF5F6FA),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              // borderRadius: new BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            // border: InputBorder.none,
                                            hintText: "+1 835 795 7981",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Address",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      width: MediaQuery.of(context).size.width *
                                          (50 / 100),
                                      child: TextFormField(
                                        initialValue: "",
                                        onChanged: (v) {
                                          setState(() {
                                            // userEmail = v.toLowerCase();
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffF5F6FA),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              // borderRadius: new BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            // border: InputBorder.none,
                                            hintText: "252 , Brooklyn ",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffFFFFFF),
                                ),
                                height: MediaQuery.of(context).size.height *
                                    (60 / 100),
                                // height: 100,
                                width: MediaQuery.of(context).size.width *
                                    (32 / 100),

                                child: Column(
                                  children: [
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        // ListTile(
                                        //   title: Text("Male"),
                                        //   leading: Radio(
                                        //     value: 1,
                                        //     groupValue: val,
                                        //     onChanged: (value) {
                                        //       setState(() {
                                        //         // val = value;
                                        //       });
                                        //     },
                                        //     activeColor: Colors.green,
                                        //   ),
                                        // ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Drop info",
                                                style: TextStyle(fontSize: 20),
                                              )),
                                        ),
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                          ),
                                          child: Align(
                                              child: Text(
                                            "21.08.2021, 10am",
                                            style: TextStyle(fontSize: 20),
                                          )),
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
                                          top: 5, right: 10, left: 15),
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "Shipment company's warehouse Location",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(15, 10, 15, 10),
                                      child: TextFormField(
                                        initialValue: "",
                                        onChanged: (v) {
                                          setState(() {
                                            // userEmail = v.toLowerCase();
                                          });
                                        },
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17),
                                        decoration: InputDecoration(
                                            fillColor: Color(0xffF5F6FA),
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedBorder:
                                                new OutlineInputBorder(
                                              // borderRadius: new BorderRadius.circular(25.0),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              borderSide: BorderSide(
                                                  width: 1.2,
                                                  color: Color(0xffF5F6FA)),
                                            ),
                                            // border: InputBorder.none,
                                            hintText:
                                                "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Date to pick-up",
                                                style: TextStyle(fontSize: 14),
                                              )),
                                        ),
                                        // Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                            left: 130,
                                          ),
                                          child: Align(
                                              child: Text(
                                            "Time to pick-up",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          width: 200,
                                          child: TextFormField(
                                            initialValue: "",
                                            onChanged: (v) {
                                              setState(() {
                                                // userEmail = v.toLowerCase();
                                              });
                                            },
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17),
                                            decoration: InputDecoration(
                                                fillColor: Color(0xffF5F6FA),
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                  // borderRadius: new BorderRadius.circular(25.0),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                // border: InputBorder.none,
                                                hintText: "10.08.2021",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          width: 200,
                                          child: TextFormField(
                                            initialValue: "",
                                            onChanged: (v) {
                                              setState(() {
                                                // userEmail = v.toLowerCase();
                                              });
                                            },
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17),
                                            decoration: InputDecoration(
                                                fillColor: Color(0xffF5F6FA),
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                  // borderRadius: new BorderRadius.circular(25.0),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                // border: InputBorder.none,
                                                hintText: "10 AM",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                "Total Miles difference",
                                                style: TextStyle(fontSize: 14),
                                              )),
                                        ),
                                        // Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                            left: 95,
                                          ),
                                          child: Align(
                                              child: Text(
                                            "Estimate",
                                            style: TextStyle(fontSize: 14),
                                          )),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          width: 200,
                                          child: TextFormField(
                                            initialValue: "",
                                            onChanged: (v) {
                                              setState(() {
                                                // userEmail = v.toLowerCase();
                                              });
                                            },
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17),
                                            decoration: InputDecoration(
                                                fillColor: Color(0xffF5F6FA),
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                  // borderRadius: new BorderRadius.circular(25.0),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                // border: InputBorder.none,
                                                hintText: "7 Miles",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15)),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          width: 200,
                                          child: TextFormField(
                                            initialValue: "",
                                            onChanged: (v) {
                                              setState(() {
                                                // userEmail = v.toLowerCase();
                                              });
                                            },
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 17),
                                            decoration: InputDecoration(
                                                fillColor: Color(0xffF5F6FA),
                                                filled: true,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedBorder:
                                                    new OutlineInputBorder(
                                                  // borderRadius: new BorderRadius.circular(25.0),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4)),
                                                  borderSide: BorderSide(
                                                      width: 1.2,
                                                      color: Color(0xffF5F6FA)),
                                                ),
                                                // border: InputBorder.none,
                                                hintText: "17.00",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  (60 / 100),
                              // height: 100,
                              width: MediaQuery.of(context).size.width *
                                  (32 / 100),

                              child: Column(
                                children: [
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      // ListTile(
                                      //   title: Text("Male"),
                                      //   leading: Radio(
                                      //     value: 1,
                                      //     groupValue: val,
                                      //     onChanged: (value) {
                                      //       setState(() {
                                      //         // val = value;
                                      //       });
                                      //     },
                                      //     activeColor: Colors.green,
                                      //   ),
                                      // ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, right: 10, left: 15),
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
                                          top: 10,
                                          right: 10,
                                        ),
                                        child: Align(
                                            child: Text(
                                          "21.08.2021, 10am",
                                          style: TextStyle(fontSize: 20),
                                        )),
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
                                        top: 5, right: 10, left: 15),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Pick- up Location",
                                          style: TextStyle(fontSize: 14),
                                        )),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                                    child: TextFormField(
                                      initialValue: "",
                                      onChanged: (v) {
                                        setState(() {
                                          // userEmail = v.toLowerCase();
                                        });
                                      },
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 17),
                                      decoration: InputDecoration(
                                          fillColor: Color(0xffF5F6FA),
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1.2,
                                                color: Color(0xffF5F6FA)),
                                          ),
                                          focusedBorder: new OutlineInputBorder(
                                            // borderRadius: new BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                                width: 1.2,
                                                color: Color(0xffF5F6FA)),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                width: 1.2,
                                                color: Color(0xffF5F6FA)),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            borderSide: BorderSide(
                                                width: 1.2,
                                                color: Color(0xffF5F6FA)),
                                          ),
                                          // border: InputBorder.none,
                                          hintText:
                                              "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15)),
                                    ),
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Date to pick-up",
                                              style: TextStyle(fontSize: 14),
                                            )),
                                      ),
                                      // Spacer(),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                          left: 130,
                                        ),
                                        child: Align(
                                            child: Text(
                                          "Time to pick-up",
                                          style: TextStyle(fontSize: 14),
                                        )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        width: 200,
                                        child: TextFormField(
                                          initialValue: "",
                                          onChanged: (v) {
                                            setState(() {
                                              // userEmail = v.toLowerCase();
                                            });
                                          },
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17),
                                          decoration: InputDecoration(
                                              fillColor: Color(0xffF5F6FA),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedBorder:
                                                  new OutlineInputBorder(
                                                // borderRadius: new BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              // border: InputBorder.none,
                                              hintText: "10.08.2021",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        width: 200,
                                        child: TextFormField(
                                          initialValue: "",
                                          onChanged: (v) {
                                            setState(() {
                                              // userEmail = v.toLowerCase();
                                            });
                                          },
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17),
                                          decoration: InputDecoration(
                                              fillColor: Color(0xffF5F6FA),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedBorder:
                                                  new OutlineInputBorder(
                                                // borderRadius: new BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              // border: InputBorder.none,
                                              hintText: "10 AM",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Total Miles difference",
                                              style: TextStyle(fontSize: 14),
                                            )),
                                      ),
                                      // Spacer(),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                          left: 95,
                                        ),
                                        child: Align(
                                            child: Text(
                                          "Estimate",
                                          style: TextStyle(fontSize: 14),
                                        )),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        width: 200,
                                        child: TextFormField(
                                          initialValue: "",
                                          onChanged: (v) {
                                            setState(() {
                                              // userEmail = v.toLowerCase();
                                            });
                                          },
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17),
                                          decoration: InputDecoration(
                                              fillColor: Color(0xffF5F6FA),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedBorder:
                                                  new OutlineInputBorder(
                                                // borderRadius: new BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              // border: InputBorder.none,
                                              hintText: "7 Miles",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(15, 10, 15, 10),
                                        width: 200,
                                        child: TextFormField(
                                          initialValue: "",
                                          onChanged: (v) {
                                            setState(() {
                                              // userEmail = v.toLowerCase();
                                            });
                                          },
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17),
                                          decoration: InputDecoration(
                                              fillColor: Color(0xffF5F6FA),
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedBorder:
                                                  new OutlineInputBorder(
                                                // borderRadius: new BorderRadius.circular(25.0),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(4)),
                                                borderSide: BorderSide(
                                                    width: 1.2,
                                                    color: Color(0xffF5F6FA)),
                                              ),
                                              // border: InputBorder.none,
                                              hintText: "17.00",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GoodsInfo()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 15, bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.black),
                              height: 45,
                              width: 300,
                              child: Center(
                                child: Text("Proceed to Goods",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
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
