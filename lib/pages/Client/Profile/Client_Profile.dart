import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/indicator.dart';
import 'package:shipment/Responsive.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ClientProfile extends StatefulWidget {
  const ClientProfile({Key? key}) : super(key: key);

  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
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
              child: ListView(children: [
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
                      // if (Responsive.isDesktop(context)) SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                        child: Text(
                          'Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Column(
                    children: [
                      profileView(),
                      Row(
                        children: [
                          profileDetails(),
                          viewPieChart(),
                        ],
                      )
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment,
                    children: [
                      profileView(),
                      Align(
                          alignment: Alignment.topLeft,
                          child: profileDetails()),
                      viewPieChart()
                    ],
                  ),
                if (Responsive.isTablet(context))
                  Column(
                    children: [profileView(), profileDetails(), viewPieChart()],
                  ),
              ])),
        ));
  }

  Widget profileView() {
    return Container(
        margin: EdgeInsets.all(15),
        height: 200,
        width: MediaQuery.of(context).size.width * (90 / 100),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Profileback.png"),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Image.asset('assets/images/Ellipse7.png'),
                  height: 150,
                  width: 100),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 10),
                        child: Text("Shishank",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Text("Shishank.barua@gmail.com",
                            style: TextStyle(
                              color: Color(0xff90A0B7),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            )),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.call,
                                size: 18,
                                color: Colors.white,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.message_outlined,
                                size: 18,
                                color: Colors.white,
                              )),
                          Container(
                              margin: EdgeInsets.only(left: 10),
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
        ));
  }

  Widget profileDetails() {
    return Container(
        height: MediaQuery.of(context).size.height * (50 / 100),
        // height: 100,
        width: (!Responsive.isDesktop(context))
            ? MediaQuery.of(context).size.width * (90 / 100)
            : MediaQuery.of(context).size.width * (32 / 100),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, right: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Shishank Barua",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  )),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Profile:",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15, left: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Professional",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Mobile Number:",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("+1 835 7957 981",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email:",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Shishank.barau@gmail.com",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("language:",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("English ",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Country:",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("United States",
                          style: TextStyle(fontSize: 14, color: Colors.black))),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("About me:",
                      style: TextStyle(fontSize: 14, color: Colors.black))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet. ",
                      style: TextStyle(fontSize: 14, color: Colors.grey))),
            ),
          ],
        ));
  }

  Widget viewPieChart() {
    return Container(
        height: MediaQuery.of(context).size.height * (50 / 100),
        // height: 100,
        width: (!Responsive.isDesktop(context))
            ? MediaQuery.of(context).size.width * (90 / 100)
            : MediaQuery.of(context).size.width * (32 / 100),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Transaction history",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
          ),
          pieChart(),
        ]));
  }
}
