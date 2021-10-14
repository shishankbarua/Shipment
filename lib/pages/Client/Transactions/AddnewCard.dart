import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
import 'package:shipment/pages/Client/Profile.dart';
import 'package:shipment/pages/Client/Transactions/Transactions.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  _AddNewCardState createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
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
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Dashboard()));
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
                                  'Save Card',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  height: MediaQuery.of(context).size.height *
                                      (57 / 100),
                                  // height: 100,
                                  width: MediaQuery.of(context).size.width *
                                      (32 / 100),
                                  margin: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color(0xffFFFFFF),
                                  ),
                                  child: ListView(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 20, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Card Details",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 15, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text("Name on Card",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey))),
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
                                        margin: EdgeInsets.only(
                                            top: 5, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Card Number",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
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
                                                  "4601 -1256- 7896 -****",
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
                                                  "Expire",
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                )),
                                          ),
                                          // Spacer(),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 10,
                                              left: 150,
                                            ),
                                            child: Align(
                                                child: Text(
                                              "CVV",
                                              style: TextStyle(fontSize: 14),
                                            )),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 10, 0, 10),
                                            width: 70,
                                            height: 40,
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
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedBorder:
                                                      new OutlineInputBorder(
                                                    // borderRadius: new BorderRadius.circular(25.0),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  // border: InputBorder.none,
                                                  hintText: "",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 10, left: 20),
                                            child: Align(
                                                child: Text(
                                              "/",
                                              style: TextStyle(fontSize: 20),
                                            )),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 10, 15, 10),
                                            height: 40,
                                            width: 70,
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
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedBorder:
                                                      new OutlineInputBorder(
                                                    // borderRadius: new BorderRadius.circular(25.0),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  // border: InputBorder.none,
                                                  hintText: "",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15)),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                15, 10, 15, 10),
                                            height: 40,
                                            width: 100,
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
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedBorder:
                                                      new OutlineInputBorder(
                                                    // borderRadius: new BorderRadius.circular(25.0),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(4)),
                                                    borderSide: BorderSide(
                                                        width: 1.2,
                                                        color:
                                                            Color(0xffF5F6FA)),
                                                  ),
                                                  // border: InputBorder.none,
                                                  hintText: "",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             CheckoutPayment()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 15, left: 15, right: 20, bottom: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.black),
                                  height: MediaQuery.of(context).size.height *
                                      (7 / 100),
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Text(
                                          "Save Card",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             PaymentDash()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          height: 20,
                                          width: 20,
                                          child: Image.asset(
                                              'assets/images/arrow-right.png'),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ))
              ]),
            ])));
  }
}
