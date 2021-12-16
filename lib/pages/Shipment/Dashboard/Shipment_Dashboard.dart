import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Shipment.dart/Dashboard/ResContainer_List.dart';
import 'package:shipment/component/Res_Shipment.dart/Review/ResReviewList.dart';
import 'package:shipment/component/Res_Shipment.dart/Shipment_Sidebar.dart';
import 'package:shipment/pages/Shipment/Dashboard/dashboard_Container.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ShipmentDashboard extends StatefulWidget {
  const ShipmentDashboard({Key? key}) : super(key: key);

  @override
  _ShipmentDashboardState createState() => _ShipmentDashboardState();
}

class _ShipmentDashboardState extends State<ShipmentDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;

  var Iamhovering = -1;
  String _value = " ";
  bool selected = true;

  void _entering(
    PointerEvent details,
    index,
  ) {
    setState(() {
      Iamhovering = index;
    });
  }

  var namelist = ['Tosco', 'Cosco', 'Mosco', 'Donco', 'Monco'];

  var statusList = [
    1,
    2,
    3,
    4,
    5,
  ];

  void _hovering(
    PointerEvent details,
    index,
  ) {
    setState(() {
      Iamhovering = index;
    });
  }

  Widget ContainerListDialog({h, w}) {
    return Container(
      height: h * 0.32,
      width: w * 0.4,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(
                  Icons.close,
                  color: Color(0xffC4C4C4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Availability",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 45, top: 5),
                        height: 15,
                        width: 15,
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/car.png',
                          ),
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("Car",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xffEFEFEF),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        height: 31,
                        width: 31,
                        child: Center(
                          child: Text("3",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 15,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 45, top: 5),
                        height: 15,
                        width: 15,
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/box.png',
                          ),
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("Boxes",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffEFEFEF),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 31,
                          width: 31,
                          child: Center(
                            child: Text("6",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 45, top: 5),
                        height: 15,
                        width: 15,
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/slidervertical.png',
                          ),
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("Barrel",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffEFEFEF),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 31,
                          width: 31,
                          child: Center(
                            child: Text("12",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 45, top: 5),
                        height: 15,
                        width: 15,
                        child: ImageIcon(
                          AssetImage(
                            'assets/images/Group 840.png',
                          ),
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text("Tv",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: 15,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffEFEFEF),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 31,
                          width: 31,
                          child: Center(
                            child: Text("6",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30),
            child: Row(
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 45, top: 5),
                  height: 15,
                  width: 15,
                  child: ImageIcon(
                    AssetImage(
                      'assets/images/bus.png',
                    ),
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text("Fridge",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontSize: 15,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffEFEFEF),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    height: 31,
                    width: 31,
                    child: Center(
                      child: Text("12",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontSize: 15,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: ShipmentSidebar(),
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
                          margin: EdgeInsets.fromLTRB(20, 10, 5, 0),
                          child: Text(
                            '',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!Responsive.isDesktop(context))
                    Column(
                      children: [
                        Row(
                          children: [
                            totalShipment(),
                            usedMode(),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: estimateCharges()),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Column(
                            children: [
                              shipmentList(),
                              SizedBox(
                                height: 10,
                              ),
                              scheduleStatus()
                            ],
                          ),
                        ),
                        mobileViewlist()
                      ],
                    ),
                  if (Responsive.isDesktop(context))
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            totalShipment(),
                            usedMode(),
                            estimateCharges(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Shipment List",
                                    style: headingStyle22blackw600(),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                side: BorderSide(
                                                    color: Colors.teal,
                                                    width: 2.0)))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          'Select Status',
                                          style: headingStyle14blackw400(),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Container(
                                            // margin: EdgeInsets.only(left: 45, top: 5),
                                            height: 20,
                                            width: 20,
                                            child: ImageIcon(
                                              AssetImage(
                                                "images/setting-3.png",
                                              ),
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff1A494F)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: BorderSide(
                                                      color: Colors.teal,
                                                      width: 2.0)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Schedule Shipment',
                                            style:
                                                headingStyleinter14whitew500(),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Container(
                                              // margin: EdgeInsets.only(left: 45, top: 5),
                                              height: 20,
                                              width: 20,
                                              child: ImageIcon(
                                                AssetImage(
                                                  "images/Vector1.png",
                                                ),
                                                size: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: BorderSide(
                                                      color: Colors.teal,
                                                      width: 2.0)))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            '21.08.2021',
                                            style: headingStyle12blackw500(),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 18),
                                            child: Container(
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: namelist.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResContainerList())),
                                  child: MouseRegion(
                                    onEnter: (val) {
                                      _entering(val, index);
                                    },
                                    onHover: (value) {
                                      _hovering(value, index);
                                    },
                                    onExit: (val) {
                                      _entering(val, -1);
                                    },
                                    child: Card(
                                      color: Iamhovering == index
                                          ? Color(0xffFFFFFF).withOpacity(1)
                                          : Color(0xffFFFFFF).withOpacity(0.5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                height: 28,
                                                width: 28,
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                  begin: Alignment.topLeft,
                                                  end: Alignment.bottomRight,
                                                  tileMode: TileMode.clamp,
                                                  colors: [
                                                    Color(0xffFFCC00),
                                                    Color(0xffFFDE17),
                                                  ],
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 50),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ResReviewlist()));
                                                },
                                                child: Text(
                                                  namelist[index],
                                                  style:
                                                      headingStyle16blackw400(),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 270),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Container list",
                                                    style:
                                                        headingStyle16blackw400(),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      showDialog(
                                                          barrierColor: Colors
                                                              .transparent,
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return Container(
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10))),
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 100,
                                                                      // top: 250,
                                                                      top: 190),
                                                              child:
                                                                  AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                content:
                                                                    ContainerListDialog(
                                                                        h: h,
                                                                        w: w),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                    icon: Icon(
                                                        Icons
                                                            .arrow_drop_down_rounded,
                                                        size: 35,
                                                        color: Iamhovering ==
                                                                index
                                                            ? Color(0xff1A494F)
                                                            : Color(
                                                                0xffE5E5E5)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 100),
                                              child: Text(
                                                "India to USA",
                                                style:
                                                    headingStyle16blackw400(),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 130),
                                              child: Container(
                                                height: 22,
                                                width: 86,
                                                color: statusList[index] == 1
                                                    ? Color(0xffFF3D00)
                                                    : statusList[index] == 2
                                                        ? Colors.blue
                                                        : statusList[index] == 3
                                                            ? Colors.green
                                                            : statusList[
                                                                        index] ==
                                                                    4
                                                                ? Colors.pink
                                                                : Colors
                                                                    .orangeAccent,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    statusList[index] == 1
                                                        ? "Closed"
                                                        : statusList[index] == 2
                                                            ? "Deliverd"
                                                            : statusList[
                                                                        index] ==
                                                                    3
                                                                ? "In Transit"
                                                                : statusList[
                                                                            index] ==
                                                                        4
                                                                    ? "Picked up"
                                                                    : "Closed",
                                                    style:
                                                        headingStyle12whitew500(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30),
                                              child: Icon(
                                                Icons.more_vert,
                                                color: Color(0xffC4C4C4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    )
                ],
              ))),
    );
  }

  Widget totalShipment() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        height: (Responsive.isDesktop(context))
            ? 168
            : MediaQuery.of(context).size.height * (20 / 100),
        width: (Responsive.isDesktop(context))
            ? 350
            : MediaQuery.of(context).size.height * (20 / 100),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Total Shippment",
                  style: headingStyleinter14blackw500(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffF7F6FB),
                    child: Container(
                      // margin: EdgeInsets.only(left: 45, top: 5),
                      height: 30,
                      width: 30,
                      child: ImageIcon(
                        AssetImage(
                          'assets/images/3d-square.png',
                        ),
                        size: 30,
                        color: Color(0xff1A494F),
                      ),
                    ),
                  ),
                  Text(
                    "2.57%",
                    style: (Responsive.isDesktop(context))
                        ? headingStyleinter40blackw500()
                        : headingStyleinter14blackw500(),
                  ),
                  Text(
                    "2.2%",
                    style: (Responsive.isDesktop(context))
                        ? headingStyleinter40blackw500()
                        : headingStyleinter14blackw500(),
                  ),
                  Container(
                    height: 16.5,
                    width: 20,
                    child: Icon(
                      Icons.arrow_drop_up_rounded,
                      color: Color(0xff1A494F),
                      size: 30,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget usedMode() {
    return Container(
      height: (Responsive.isDesktop(context))
          ? 168
          : MediaQuery.of(context).size.height * (20 / 100),
      width: (Responsive.isDesktop(context))
          ? 350
          : MediaQuery.of(context).size.height * (20 / 100),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Highest Used Mode",
                style: headingStyleinter14blackw500(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffF7F6FB),
                    child: Container(
                      // margin: EdgeInsets.only(left: 45, top: 5),
                      height: 30,
                      width: 30,
                      child: ImageIcon(
                        AssetImage(
                          'images/box.png',
                        ),
                        size: 30,
                        color: Color(0xff1A494F),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: (Responsive.isDesktop(context)) ? 30 : 0,
                ),
                Text(
                  "50",
                  style: (Responsive.isDesktop(context))
                      ? headingStyleinter40blackw500()
                      : headingStyleinter14blackw500(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget estimateCharges() {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 10),
      height: (Responsive.isDesktop(context))
          ? 168
          : MediaQuery.of(context).size.height * (20 / 100),
      width: (Responsive.isDesktop(context))
          ? 320
          : MediaQuery.of(context).size.height * (20 / 100),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Average Estimated Charge",
                style: headingStyleinter14blackw500(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffF7F6FB),
                  child: Container(
                    // margin: EdgeInsets.only(left: 45, top: 5),
                    height: 30,
                    width: 30,
                    child: ImageIcon(
                      AssetImage(
                        'images/box1.png',
                      ),
                      size: 30,
                      color: Color(0xff1A494F),
                    ),
                  ),
                ),
                Text(
                  "\$200",
                  style: (Responsive.isDesktop(context))
                      ? headingStyleinter40blackw500()
                      : headingStyleinter14blackw500(),
                ),
                Text(
                  "2.2%",
                  style: (Responsive.isDesktop(context))
                      ? headingStyleinter40blackw500()
                      : headingStyleinter14blackw500(),
                ),
                Container(
                  height: 16.5,
                  width: 20,
                  child: Icon(
                    Icons.arrow_drop_up_rounded,
                    color: Color(0xff1A494F),
                    size: 35,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget shipmentList() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Text(
            "Shipment List",
            style: (Responsive.isDesktop(context))
                ? headingStyleinter40blackw500()
                : headingStyleinter14blackw500(),
          ),
        ),
        (Responsive.isDesktop(context))
            ? SizedBox(
                width: 30,
              )
            : Spacer(),
        Container(
          margin: EdgeInsets.only(right: 15),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.teal, width: 2.0)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Select Status',
                  style: headingStyle14blackw400(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    // margin: EdgeInsets.only(left: 45, top: 5),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        "images/setting-3.png",
                      ),
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget scheduleStatus() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff1A494F)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.teal, width: 2.0)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Schedule Shipment',
                  style: headingStyleinter14whitew500(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    // margin: EdgeInsets.only(left: 45, top: 5),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        "images/Vector1.png",
                      ),
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (Responsive.isDesktop(context))
              ? SizedBox(
                  width: 30,
                )
              : Spacer(),
          ElevatedButton(
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
                  style: headingStyle12blackw500(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget mobileViewlist() {
    return ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResContainerList()));
            },
            child: Container(
              // height: (!Responsive.isDesktop(context))
              //     ? MediaQuery.of(context).size.height * (10 / 100)
              //     : MediaQuery.of(context).size.height * (45 / 100),
              height: MediaQuery.of(context).size.height * (65 / 100),
              width: w,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xffFFFFFF),
              ),

              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(left: 15, top: 15),
                          child: Text(
                            "Firm Name",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(top: 15, right: 20),
                          child: Text(
                            "Status",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            "Tosco - China Ocean cfdfsdfsdyxzzz ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                        color: Color(0xffFF3D00),
                        width: MediaQuery.of(context).size.width * (40 / 100),
                        margin: EdgeInsets.only(top: 10, right: 20),
                        child: Text("Closed", style: headingStyle12whitew500()),
                      )
                    ],
                  ),
                  Container(
                      // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                    color: Colors.grey,
                    height: 36,
                  )),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            "From",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(top: 10, right: 20),
                          child: Text("To",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black))),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            "India",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: MediaQuery.of(context).size.width * (40 / 100),
                          margin: EdgeInsets.only(top: 10, right: 20),
                          child: Text("USA",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Availability",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 45, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/car.png',
                                  ),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("Car",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xffEFEFEF),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                height: 31,
                                width: 31,
                                child: Center(
                                  child: Text("3",
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 45, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/box.png',
                                  ),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("Boxes",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffEFEFEF),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 31,
                                  width: 31,
                                  child: Center(
                                    child: Text("6",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 45, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/slidervertical.png',
                                  ),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("Barrel",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffEFEFEF),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 31,
                                  width: 31,
                                  child: Center(
                                    child: Text("12",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Row(
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 45, top: 5),
                                height: 15,
                                width: 15,
                                child: ImageIcon(
                                  AssetImage(
                                    'assets/images/Group 840.png',
                                  ),
                                  size: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text("Tv",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 15,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffEFEFEF),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  height: 31,
                                  width: 31,
                                  child: Center(
                                    child: Text("6",
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          color: Colors.black,
                                          fontSize: 15,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 30),
                    child: Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(left: 45, top: 5),
                          height: 15,
                          width: 15,
                          child: ImageIcon(
                            AssetImage(
                              'assets/images/bus.png',
                            ),
                            size: 20,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text("Fridge",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 15,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color(0xffEFEFEF),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            height: 31,
                            width: 31,
                            child: Center(
                              child: Text("12",
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                    fontSize: 15,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
