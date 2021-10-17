import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Responsive.dart';
import 'package:shipment/component/GoodsInfo.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SelectReceptionist extends StatefulWidget {
  const SelectReceptionist({Key? key}) : super(key: key);

  @override
  _SelectReceptionistState createState() => _SelectReceptionistState();
}

class _SelectReceptionistState extends State<SelectReceptionist> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  int _selectedIndex = 0;
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
            child: ListView(
              children: [
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
                        margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                        child: Text(
                          'Dashboard > Cosco >Pickup / Drop Off',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  (65 / 100),
                              // height: 100,

                              width: MediaQuery.of(context).size.width *
                                  (32 / 100),
                              child: receptionistInfo()),
                          Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xffFFFFFF),
                              ),
                              height: MediaQuery.of(context).size.height *
                                  (65 / 100),
                              // height: 100,

                              width: MediaQuery.of(context).size.width *
                                  (32 / 100),
                              child: dropInfo()),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Color(0xffFFFFFF),
                          ),
                          height:
                              MediaQuery.of(context).size.height * (65 / 100),
                          // height: 100,

                          width: MediaQuery.of(context).size.width * (32 / 100),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: pickupInfo())),
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft,
                            child: receptionistInfo()),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft, child: dropInfo()),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft, child: pickupInfo()),
                      ),
                      // dropInfo(),
                      // pickupInfo(),
                    ],
                  ),
                if (Responsive.isTablet(context))
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft,
                            child: receptionistInfo()),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft, child: dropInfo()),
                      ),
                      Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xffFFFFFF),
                        ),
                        height: MediaQuery.of(context).size.height * (65 / 100),
                        // height: 100,

                        width: MediaQuery.of(context).size.width * (90 / 100),

                        child: Align(
                            alignment: Alignment.topLeft, child: pickupInfo()),
                      ),
                      // dropInfo(),
                      // pickupInfo(),
                    ],
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GoodsInfo()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 15, left: 30, right: 30, bottom: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Color(0xff1F2326)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.all(15),
                            // color: Colors.lime,
                            child: Text("Proceed to Goods",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ))),
                        Container(
                          margin: EdgeInsets.only(top: 15, right: 10, left: 30),
                          height: 30,
                          // width: 300,
                          child: Image.asset('assets/images/arrow-right.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget receptionistInfo() {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Receptionist information",
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
        Container(
          margin: EdgeInsets.only(top: 5, right: 10, left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Name",
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
            style: TextStyle(color: Colors.black54, fontSize: 17),
            decoration: InputDecoration(
                fillColor: Color(0xffF5F6FA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedBorder: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                // border: InputBorder.none,
                hintText: "Shishank Barua",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Email address",
                style: TextStyle(fontSize: 14),
              )),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          width: MediaQuery.of(context).size.width * (50 / 100),
          child: TextFormField(
            initialValue: "",
            onChanged: (v) {
              setState(() {
                // userEmail = v.toLowerCase();
              });
            },
            style: TextStyle(color: Colors.black54, fontSize: 17),
            decoration: InputDecoration(
                fillColor: Color(0xffF5F6FA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedBorder: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                // border: InputBorder.none,
                hintText: "Shishank.Barua@gamil.com",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Contact number",
                style: TextStyle(fontSize: 14),
              )),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          width: MediaQuery.of(context).size.width * (50 / 100),
          child: TextFormField(
            initialValue: "",
            onChanged: (v) {
              setState(() {
                // userEmail = v.toLowerCase();
              });
            },
            style: TextStyle(color: Colors.black54, fontSize: 17),
            decoration: InputDecoration(
                fillColor: Color(0xffF5F6FA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedBorder: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                // border: InputBorder.none,
                hintText: "+1 835 795 7981",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Address",
                style: TextStyle(fontSize: 14),
              )),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
          width: MediaQuery.of(context).size.width * (50 / 100),
          child: TextFormField(
            initialValue: "",
            onChanged: (v) {
              setState(() {
                // userEmail = v.toLowerCase();
              });
            },
            style: TextStyle(color: Colors.black54, fontSize: 17),
            decoration: InputDecoration(
                fillColor: Color(0xffF5F6FA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedBorder: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                // border: InputBorder.none,
                hintText: "252 , Brooklyn ",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
      ],
    );
  }

  Widget dropInfo() {
    return ListView(
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
              margin: EdgeInsets.only(top: 10, right: 10, left: 15),
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
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            height: 30,
            color: Colors.black,
            thickness: 2,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, right: 10, left: 15),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Shipment company's warehouse Location",
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
            style: TextStyle(color: Colors.black54, fontSize: 17),
            decoration: InputDecoration(
                fillColor: Color(0xffF5F6FA),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedBorder: new OutlineInputBorder(
                  // borderRadius: new BorderRadius.circular(25.0),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                ),
                // border: InputBorder.none,
                hintText:
                    "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          ),
        ),
        if (Responsive.isDesktop(context))
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (15 / 100),
                child: Column(
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 15),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Date to pick-up",
                            style: TextStyle(fontSize: 14),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (15 / 100),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (v) {
                          setState(() {
                            // userEmail = v.toLowerCase();
                          });
                        },
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        decoration: InputDecoration(
                            fillColor: Color(0xffF5F6FA),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            // border: InputBorder.none,
                            hintText: "10.08.2021",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                width: MediaQuery.of(context).size.width * (15 / 100),
                child: Column(
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Align(
                          child: Text(
                        "Time to pick-up",
                        style: TextStyle(fontSize: 14),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (15 / 100),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (v) {
                          setState(() {
                            // userEmail = v.toLowerCase();
                          });
                        },
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        decoration: InputDecoration(
                            fillColor: Color(0xffF5F6FA),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            // border: InputBorder.none,
                            hintText: "10 AM",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        if (Responsive.isMobile(context))
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Date to pick-up",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "10.08.2021",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Time to pick-up",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "10 AM",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            ],
          ),
        if (Responsive.isTablet(context))
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Date to pick-up",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "10.08.2021",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Time to pick-up",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "10 AM",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            ],
          ),
        if (Responsive.isDesktop(context))
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (15 / 100),
                child: Column(
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 15),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Total Miles difference",
                            style: TextStyle(fontSize: 14),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (15 / 100),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (v) {
                          setState(() {
                            // userEmail = v.toLowerCase();
                          });
                        },
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        decoration: InputDecoration(
                            fillColor: Color(0xffF5F6FA),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            // border: InputBorder.none,
                            hintText: "7 Miles",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  right: 10,
                ),
                width: MediaQuery.of(context).size.width * (15 / 100),
                child: Column(
                  // crossAxisAlignment:
                  //     CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Align(
                          child: Text(
                        "Estimate",
                        style: TextStyle(fontSize: 14),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (15 / 100),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (v) {
                          setState(() {
                            // userEmail = v.toLowerCase();
                          });
                        },
                        style: TextStyle(color: Colors.black54, fontSize: 17),
                        decoration: InputDecoration(
                            fillColor: Color(0xffF5F6FA),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              // borderRadius: new BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1.2, color: Color(0xffF5F6FA)),
                            ),
                            // border: InputBorder.none,
                            hintText: "17:00",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        if (Responsive.isMobile(context))
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total Miles difference",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "7 Miles",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Estimate",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "17:00",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            ],
          ),
        if (Responsive.isTablet(context))
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Total Miles difference",
                      style: TextStyle(fontSize: 14),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "7 Miles",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Align(
                    child: Text(
                  "Estimate",
                  style: TextStyle(fontSize: 14),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                // width: MediaQuery.of(context).size.width * (15 / 100),
                child: TextFormField(
                  initialValue: "",
                  onChanged: (v) {
                    setState(() {
                      // userEmail = v.toLowerCase();
                    });
                  },
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Color(0xffF5F6FA),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                      ),
                      // border: InputBorder.none,
                      hintText: "17:00",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget pickupInfo() {
    return Align(
      alignment: Alignment.topLeft,
      child: ListView(
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
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Divider(
              height: 30,
              color: Colors.black,
              thickness: 2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, right: 10, left: 15),
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
              style: TextStyle(color: Colors.black54, fontSize: 17),
              decoration: InputDecoration(
                  fillColor: Color(0xffF5F6FA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    // borderRadius: new BorderRadius.circular(25.0),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                  ),
                  // border: InputBorder.none,
                  hintText:
                      "Fourwinds, Upper Campsfield Road, Woodstock, OX20 1QG",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * (15 / 100),
                  child: Column(
                    // crossAxisAlignment:
                    //     CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Date to pick-up",
                              style: TextStyle(fontSize: 14),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                        width: MediaQuery.of(context).size.width * (15 / 100),
                        child: TextFormField(
                          initialValue: "",
                          onChanged: (v) {
                            setState(() {
                              // userEmail = v.toLowerCase();
                            });
                          },
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                // borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              // border: InputBorder.none,
                              hintText: "10.08.2021",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  width: MediaQuery.of(context).size.width * (15 / 100),
                  child: Column(
                    // crossAxisAlignment:
                    //     CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Align(
                            child: Text(
                          "Time to pick-up",
                          style: TextStyle(fontSize: 14),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                        width: MediaQuery.of(context).size.width * (15 / 100),
                        child: TextFormField(
                          initialValue: "",
                          onChanged: (v) {
                            setState(() {
                              // userEmail = v.toLowerCase();
                            });
                          },
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                // borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              // border: InputBorder.none,
                              hintText: "10 AM",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (Responsive.isMobile(context))
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date to pick-up",
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "10.08.2021",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Time to pick-up",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "10 AM",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ],
            ),
          if (Responsive.isTablet(context))
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Date to pick-up",
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "10.08.2021",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Time to pick-up",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "10 AM",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ],
            ),
          if (Responsive.isDesktop(context))
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * (15 / 100),
                  child: Column(
                    // crossAxisAlignment:
                    //     CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 15),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Total Miles difference",
                              style: TextStyle(fontSize: 14),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                        width: MediaQuery.of(context).size.width * (15 / 100),
                        child: TextFormField(
                          initialValue: "",
                          onChanged: (v) {
                            setState(() {
                              // userEmail = v.toLowerCase();
                            });
                          },
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                // borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              // border: InputBorder.none,
                              hintText: "7 Miles",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 10,
                  ),
                  width: MediaQuery.of(context).size.width * (15 / 100),
                  child: Column(
                    // crossAxisAlignment:
                    //     CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Align(
                            child: Text(
                          "Estimate",
                          style: TextStyle(fontSize: 14),
                        )),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                        width: MediaQuery.of(context).size.width * (15 / 100),
                        child: TextFormField(
                          initialValue: "",
                          onChanged: (v) {
                            setState(() {
                              // userEmail = v.toLowerCase();
                            });
                          },
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                // borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1.2, color: Color(0xffF5F6FA)),
                              ),
                              // border: InputBorder.none,
                              hintText: "17:00",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          if (Responsive.isMobile(context))
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Total Miles difference",
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "7 Miles",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Estimate",
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "17:00",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ],
            ),
          if (Responsive.isTablet(context))
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Total Miles difference",
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 15, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "7 Miles",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Align(
                      child: Text(
                    "Estimate",
                    style: TextStyle(fontSize: 14),
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                  // width: MediaQuery.of(context).size.width * (15 / 100),
                  child: TextFormField(
                    initialValue: "",
                    onChanged: (v) {
                      setState(() {
                        // userEmail = v.toLowerCase();
                      });
                    },
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        // border: InputBorder.none,
                        hintText: "17:00",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
