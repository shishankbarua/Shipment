import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoodsInfo extends StatefulWidget {
  const GoodsInfo({Key? key}) : super(key: key);

  @override
  _GoodsInfoState createState() => _GoodsInfoState();
}

class _GoodsInfoState extends State<GoodsInfo> {
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
                    child: ListView(children: [
                      Column(
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                                child: Text(
                                  'Dashboard > Cosco >Pickup / Drop Off > Goods info',
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
                        ],
                      ),
                    ])),
              ])
            ])));
  }
}
