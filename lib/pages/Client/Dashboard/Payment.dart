import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shipment/component/SideDrawer.dart';
import 'package:shipment/pages/Client/Dashboard/CheckoutDash.dart';

class PaymentDash extends StatefulWidget {
  const PaymentDash({Key? key}) : super(key: key);

  @override
  _PaymentDashState createState() => _PaymentDashState();
}

class _PaymentDashState extends State<PaymentDash> {
  bool _value = false;
  int? val = -1;
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

  Widget sideBar() {
    return Container(
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
                    setState(() {
                      openSUBMENU = !openSUBMENU;
                    });
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
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                            child: Text(
                              ' < Payment',
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
                        children: [
                          Container(
                            // height:
                            //     MediaQuery.of(context).size.height * (90 / 100),
                            // height: 100,
                            width:
                                MediaQuery.of(context).size.width * (38 / 100),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      (51 / 100),
                                  // height: 100,
                                  width: MediaQuery.of(context).size.width *
                                      (38 / 100),

                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 10),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text("Orders",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 10),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  String.fromCharCodes(
                                                          new Runes('\u0024')) +
                                                      "667",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10, left: 10),
                                          child: Image.asset(
                                            'assets/images/Cars.png',
                                          ))
                                    ],
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Text(
                                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                                      style: TextStyle(color: Colors.grey),
                                    )),
                                Container(
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff4CAF50)),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xffFFFFFF),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        (15 / 100),
                                    // height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        (38 / 100),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Pick up",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "50.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, top: 15),
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
                                                left: 5, top: 15),
                                            child: Text("Cars")),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Color(0xffEFEFEF)),
                                            child: Text("3")),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 15),
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
                                                left: 10, top: 15),
                                            child: Text("Boxes")),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Color(0xffEFEFEF)),
                                            child: Text("5"))
                                      ])
                                    ])),
                                Container(
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xff4CAF50)),
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xffFFFFFF),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        (15 / 100),
                                    // height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        (38 / 100),
                                    child: Column(children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10,
                                                right: 10,
                                                left: 15,
                                                bottom: 20),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Drop off",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "50.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, top: 15),
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
                                                left: 5, top: 15),
                                            child: Text("Cars")),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 10, top: 15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Color(0xffEFEFEF)),
                                            child: Text("3")),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 15, top: 15),
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
                                                left: 10, top: 15),
                                            child: Text("Boxes")),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 5, top: 15),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                color: Color(0xffEFEFEF)),
                                            child: Text("5"))
                                      ])
                                    ]))
                              ],
                            ),
                          ),
                          Container(
                            // height:
                            //     MediaQuery.of(context).size.height * (90 / 100),
                            // height: 100,
                            width:
                                MediaQuery.of(context).size.width * (38 / 100),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  height: MediaQuery.of(context).size.height *
                                      (78 / 100),
                                  // height: 100,
                                  width: MediaQuery.of(context).size.width *
                                      (38 / 100),

                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Price summary",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Divider(
                                          height: 30,
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Item 1",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "BMW Cars",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "QTY",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "3",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Car Price",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "210.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Item 2",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              "Boxes",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "QTY",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "4",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Box Price",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "210.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Pick Up fee",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "17",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Shiping Fee",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "250",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Total Price",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "687",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Amet minim mollit non deserunt ullamco.",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Discount",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "-40.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Amet minim mollit non deserunt ullamco.",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            )),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 15, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Tax",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 15,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "20.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Divider(
                                          height: 30,
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, right: 10, left: 15),
                                            child: Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  "Total Amount",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                )),
                                          ),
                                          Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10,
                                              right: 30,
                                            ),
                                            child: Align(
                                                child: Text(
                                              String.fromCharCodes(
                                                      new Runes('\u0024')) +
                                                  "667.00",
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CheckoutPayment()));
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(top: 15, bottom: 70),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.black),
                                    height: 45,
                                    width: 300,
                                    child: Center(
                                      child: Text("Check out",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                              ],
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
