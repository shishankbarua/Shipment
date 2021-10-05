import 'package:flutter/material.dart';
import 'package:shipment/Element/indicator.dart';
import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
import 'package:shipment/pages/Client/Transactions/Transactions.dart';
import 'package:fl_chart/fl_chart.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var h, w;
  var exp = true, openSUBMENU = false;
  int touchedIndex = -1;

  Widget pieChart() {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: const Color(0xff0293ee),
                  text: 'One',
                  isSquare: false,
                  size: touchedIndex == 0 ? 18 : 16,
                  textColor: touchedIndex == 0 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xfff8b250),
                  text: 'Two',
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xff845bef),
                  text: 'Three',
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xff13d38e),
                  text: 'Four',
                  isSquare: false,
                  size: touchedIndex == 3 ? 18 : 16,
                  textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 1,
                      centerSpaceRadius: 0,
                      sections: showingSections()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final opacity = isTouched ? 1.0 : 0.6;

        final color0 = const Color(0xff0293ee);
        final color1 = const Color(0xfff8b250);
        final color2 = const Color(0xff845bef);
        final color3 = const Color(0xff13d38e);

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0.withOpacity(opacity),
              value: 25,
              title: '',
              radius: 80,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff044d7c)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color0, width: 6)
                  : BorderSide(color: color0.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1.withOpacity(opacity),
              value: 25,
              title: '',
              radius: 65,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff90672d)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color1, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2.withOpacity(opacity),
              value: 25,
              title: '',
              radius: 60,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4c3788)),
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? BorderSide(color: color2, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          case 3:
            return PieChartSectionData(
              color: color3.withOpacity(opacity),
              value: 25,
              title: '',
              radius: 70,
              titleStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0c7f55)),
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? BorderSide(color: color3, width: 6)
                  : BorderSide(color: color2.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
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
                                  'Profile',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width *
                                    (75 / 100),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/Profileback.png"),
                                        fit: BoxFit.fill)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          child: Image.asset(
                                              'assets/images/Ellipse7.png'),
                                          height: 150,
                                          width: 100),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 50, left: 10),
                                                child: Text("Shishank",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    )),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    right: 10, left: 10),
                                                child: Text(
                                                    "Shishank.barua@gmail.com",
                                                    style: TextStyle(
                                                      color: Color(0xff90A0B7),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                    )),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Icon(
                                                        Icons.call,
                                                        size: 18,
                                                        color: Colors.white,
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Icon(
                                                        Icons.message_outlined,
                                                        size: 18,
                                                        color: Colors.white,
                                                      )),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Icon(
                                                        Icons.location_on,
                                                        size: 18,
                                                        color: Colors.white,
                                                      )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            Row(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        (50 / 100),
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
                                                "Shishank Barua",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 15),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Profile:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 5),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Professional",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Mobile Number:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("+1 835 7957 981",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Email:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                      "Shishank.barau@gmail.com",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("language:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("English ",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("Country:",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, left: 5),
                                              child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text("United States",
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black))),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 20, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text("About me:",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black))),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, left: 15),
                                          child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. ",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey))),
                                        ),
                                      ],
                                    )),
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        (50 / 100),
                                    // height: 100,
                                    width: MediaQuery.of(context).size.width *
                                        (32 / 100),
                                    margin: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Color(0xffFFFFFF),
                                    ),
                                    child: ListView(children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 20, right: 10, left: 15),
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Transaction history",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                      pieChart(),
                                    ])),
                              ],
                            )
                          ],
                        ),
                      ],
                    )),
              ]),
            ])));
  }
}
