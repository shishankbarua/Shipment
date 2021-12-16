import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/component/Accountant/AccountSidebar.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class AccountScheduleShipment extends StatefulWidget {
  const AccountScheduleShipment({Key? key}) : super(key: key);

  @override
  _AccountScheduleShipmentState createState() =>
      _AccountScheduleShipmentState();
}

class _AccountScheduleShipmentState extends State<AccountScheduleShipment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  TabController? _tabController;
  var selected = [];
  var itemNames = [
    'Cars',
    'TV',
    'Fridge',
    'AC',
    'Cartons',
    'Luggage',
    'Home Decor',
  ];

  String? category;

  var amount;
  var item = [
    "Cargo",
    "Air",
    "Ship",
  ];
  final TextEditingController _controllr = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: AccountantSideBar(),
      ),
      body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          height: h,
          color: Color(0xffF5F6F8),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                      margin: EdgeInsets.fromLTRB(5, 10, 50, 0),
                      child: Row(
                        children: [
                          Text(
                            'Schedule Shipment',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          // Spacer(),
                          if (Responsive.isDesktop(context)) topBar()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!Responsive.isDesktop(context))
                Column(
                  children: [topBar()],
                ),
              shipmentType(),
            ],
          ))),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            height: 48,
            width: (Responsive.isDesktop(context))
                ? 349
                : MediaQuery.of(context).size.width * (30 / 100),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xff90A0B7),
                ),
                Text(
                  "Search",
                  style: headingStyle12greynormal(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: (Responsive.isDesktop(context))
                ? 136
                : MediaQuery.of(context).size.width * (40 / 100),
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.teal, width: 2.0)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '21.08.2021',
                    style: headingStyle12blacknormal(),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 45, top: 5),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        "images/menu-board.png",
                      ),
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget shipmentType() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      margin: EdgeInsets.only(left: 24, top: 15, right: 10),
      height: h,
      width: w,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Choose your shipment type",
                style: headingStyleAppColor18MB(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              // width: MediaQuery.of(context).size.width * (50 / 100),
              width: 250,
              // height: h,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // SizedBox(height: 20.0),
                    DefaultTabController(
                        length: 3, // length of tabs
                        initialIndex: 0,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Container(
                                child: TabBar(
                                  labelColor: Color(0xff1A494F),
                                  unselectedLabelColor: Colors.grey,
                                  indicatorColor: Color(0xff1A494F),
                                  tabs: <Widget>[
                                    new Tab(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Icon(
                                            Icons.local_airport_outlined,
                                            size: 18,
                                            color: Colors.black,
                                          )),
                                          Container(
                                            child: Text(
                                              "Plane",
                                              // style: headingStyle14tealw500(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Tab(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Icon(
                                            Icons.directions_boat_filled,
                                            size: 18,
                                            // color: Colors.black,
                                          )),
                                          Container(
                                            child: Text(
                                              "Boat",
                                              // style: headingStyle14tealw500(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    new Tab(
                                      child: Row(
                                        children: [
                                          Container(
                                              child: Icon(
                                            Icons.local_shipping_outlined,
                                            size: 18,
                                            // color: Colors.black,
                                          )),
                                          Container(
                                            child: Text(
                                              "Road",
                                              // style: headingStyle14tealw500(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ])),
                  ]),
            ),
          ),
          Container(
              // height: h,
              width: w, //height of TabBarView
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5))),
              child: TabBarView(children: <Widget>[
                planeShiping(),
              ]))
        ],
      ),
    );
  }

  Widget planeShiping() {
    return Container(
      // height: h * 0.8,
      decoration: BoxDecoration(
        // border: Border.all(width: 15, color: Colors.green),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(25, 15, 0, 0),
                height: 52,
                width: MediaQuery.of(context).size.width * (25 / 100),
                child: TextFormField(
                  initialValue: '',
                  onChanged: (value) {},
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      // filled: true,

                      // border: InputBorder.none,
                      hintText: "From",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15)),
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
                width: MediaQuery.of(context).size.width * (25 / 100),
                child: TextFormField(
                  initialValue: '',
                  onChanged: (value) {},
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      // filled: true,

                      // border: InputBorder.none,
                      hintText: "To",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
              // Container(
              //     margin: EdgeInsets.only(left: 10, top: 15),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.0),
              //         color: Color(0xffEEEEEE)),
              //     height: 52,
              //     // width: MediaQuery.of(context).size.width *
              //     //     (40 / 100),
              //     child: Image.asset(
              //       'assets/images/dummy.png',
              //     )),
              Spacer(),
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 5, 0),
                height: 52,
                width: MediaQuery.of(context).size.width * (10 / 100),
                child: TextFormField(
                  initialValue: '',
                  onChanged: (value) {},
                  style: TextStyle(color: Colors.black54, fontSize: 17),
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      // filled: true,

                      // border: InputBorder.none,
                      hintText: "Departure Date",
                      hintStyle: TextStyle(color: Colors.black, fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 15),
                height: 20,
                width: 20,
                child: ImageIcon(
                  AssetImage(
                    "images/menu-board.png",
                  ),
                  size: 20,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Container(
          //     margin: EdgeInsets.only(top: 10, left: 10),
          //     child: Text(
          //       "Destination warehouse",
          //       style: headingStyleNormal(),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          //   child: TextFormField(
          //     initialValue: "",
          //     autofocus: false,
          //     onChanged: (v) {
          //       setState(() {
          //         // userEmail = v.toLowerCase();
          //       });
          //     },
          //     style: TextStyle(color: Colors.black54, fontSize: 17),
          //     decoration: InputDecoration(
          //         fillColor: Color(0xffEFEFEF),
          //         filled: true,
          //         enabledBorder: OutlineInputBorder(
          //           borderSide:
          //               BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
          //         ),
          //         focusedBorder: new OutlineInputBorder(
          //           // borderRadius: new BorderRadius.circular(25.0),
          //           borderSide:
          //               BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
          //         ),
          //         errorBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(4)),
          //           borderSide:
          //               BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
          //         ),
          //         focusedErrorBorder: OutlineInputBorder(
          //           borderRadius: BorderRadius.all(Radius.circular(4)),
          //           borderSide:
          //               BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
          //         ),
          //         // border: InputBorder.none,
          //         hintText: "",
          //         hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
          //   ),
          // ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * (30 / 100),
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
                            "Destination Warehouse",
                            style: headingStyleNormal(),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (30 / 100),
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
                            hintText: "",
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
                width: MediaQuery.of(context).size.width * (30 / 100),
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
                            "Title",
                            style: headingStyleNormal(),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                      width: MediaQuery.of(context).size.width * (30 / 100),
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
                            hintText: "",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Item type",
                style: headingStyleNormal(),
              ),
            ),
          ),
          (Responsive.isDesktop(context))
              ? Container(
                  height: h * 0.08,
                  width: w * 0.8,
                  child: Scrollbar(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemNames.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (!selected.contains(itemNames[index])) {
                              selected.add(itemNames[index]);
                            } else {
                              selected.remove(itemNames[index]);
                            }
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: selected.contains(itemNames[index])
                                    ? Color(0xff1A494F)
                                    : Color(0xffEFEFEF)),
                            height: 45,
                            width: (!Responsive.isDesktop(context))
                                ? MediaQuery.of(context).size.width * 0.15
                                : MediaQuery.of(context).size.width * 0.08,
                            // color: Colors.lime,
                            child: Center(
                              child: Text(
                                itemNames[index],
                                style: TextStyle(
                                  color: selected.contains(itemNames[index])
                                      ? Color(0xffFFFFFF)
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Container(
                  height: h * 0.08,
                  width: w * 0.8,
                  child: Scrollbar(
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: itemNames.length,
                      shrinkWrap: true,
                      // scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        childAspectRatio: 2,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            if (!selected.contains(itemNames[index])) {
                              selected.add(itemNames[index]);
                            } else {
                              selected.remove(itemNames[index]);
                            }
                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: selected.contains(itemNames[index])
                                    ? Color(0xff1A494F)
                                    : Color(0xffEFEFEF)),
                            height: 45,
                            width: (!Responsive.isDesktop(context))
                                ? MediaQuery.of(context).size.width * 0.15
                                : MediaQuery.of(context).size.width * 0.08,
                            // color: Colors.lime,
                            child: Center(
                              child: Text(
                                itemNames[index],
                                style: TextStyle(
                                  color: selected.contains(itemNames[index])
                                      ? Color(0xffFFFFFF)
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          (Responsive.isDesktop(context))
              ? Container(
                  height: h * 0.4,
                  child: GridView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: selected.length,
                    shrinkWrap: true,

                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                    itemBuilder: (context, index) {
                      //       ListView.builder(
                      // // physics: NeverScrollableScrollPhysics(),
                      // itemCount: selected.length,
                      // itemBuilder: (context, index) {
                      return formTypes(title: selected[index]);
                    },
                  ),
                )
              : Container(
                  height: h * 0.3,
                  width: w,
                  child: ListView.builder(
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: selected.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return formTypes(title: selected[index]);
                    },
                  ),
                )
        ],
      ),
    );
  }

  Widget formTypes({title}) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "$title" + " Type",
                style: headingStyleNormal(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              // width: 500,
              height: 40,
              margin: EdgeInsets.only(left: 16, right: 10),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      new Expanded(
                        child: new TextField(
                          enabled: false,
                          controller: _controllr,
                        ),
                      ),
                      new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          category = value;
                          _controllr.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return item
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        (90 / 100),
                                    child: new Text(value)),
                                value: value);
                          }).toList();
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Shipping Fee",
                style: headingStyleNormal(),
              ),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              initialValue: "",
              autofocus: false,
              onChanged: (v) {
                setState(() {
                  // userEmail = v.toLowerCase();
                });
              },
              style: TextStyle(color: Colors.black54, fontSize: 17),
              decoration: InputDecoration(
                  fillColor: Color(0xffEFEFEF),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    // borderRadius: new BorderRadius.circular(25.0),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  // border: InputBorder.none,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Number of" + " $title",
                style: headingStyleNormal(),
              ),
            ),
          ),
          Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: TextFormField(
              initialValue: "",
              autofocus: false,
              onChanged: (v) {
                setState(() {
                  // userEmail = v.toLowerCase();
                });
              },
              style: TextStyle(color: Colors.black54, fontSize: 17),
              decoration: InputDecoration(
                  fillColor: Color(0xffEFEFEF),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    // borderRadius: new BorderRadius.circular(25.0),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide:
                        BorderSide(width: 1.2, color: Color(0xffEFEFEF)),
                  ),
                  // border: InputBorder.none,
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
