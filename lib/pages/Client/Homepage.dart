import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var h, w;
  var exp = false, openSUBMENU = false;
  var toShow = 'Dashboard';
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
                                  setState(() {
                                    toShow = 'Dashboard';
                                  });
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Dashboard()));
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
                                              'assets/images/Vector.png',
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
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    toShow = 'Transaction';
                                  });
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Dashboard()));
                                },
                                child: Container(
                                  // margin: EdgeInsets.only(top: 15),
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
                                            'assets/images/Vector.png',
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
                                      'assets/images/Vector.png',
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
                                      'assets/images/Vector.png',
                                    ),
                                    size: 10,
                                  )),
                            ],
                          ),
                  ),
                ),
                Container(
                  height: h,
                  width: exp ? w * 0.8 : w,
                  // child: toShow == "Dashboard"
                  //     ? Dashboard()
                  //     : toShow == "Transaction"
                  //         ? Transactions()
                  //         : Container(
                  //             height: h,
                  //             width: w,
                  //             child: Center(
                  //               child: Text("IN PROGRESS"),
                  //             ),
                  //           ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
