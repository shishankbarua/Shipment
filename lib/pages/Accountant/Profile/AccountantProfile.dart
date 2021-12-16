import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/indicator.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Accountant/AccountSidebar.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class AccountantProfile extends StatefulWidget {
  const AccountantProfile({Key? key}) : super(key: key);

  @override
  _AccountantProfileState createState() => _AccountantProfileState();
}

class _AccountantProfileState extends State<AccountantProfile> {
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

  bool onEdit = false;
  final TextEditingController controller = TextEditingController();
  final TextEditingController languagectrl = TextEditingController();

  List<String> _countries = [
    'India',
    'Japan',
    'China',
    'USA',
    'France',
    'Egypt',
    'Norway',
    'Nigeria',
    'Colombia',
    'Australia',
    'South Korea',
    'Bangladesh',
    'Mozambique',
    'Canada',
    'Germany',
    'Belgium',
    'Vietnam',
    'Bhutan',
    'Israel',
    'Brazil'
  ];

  List getSuggestions(String query) {
    List matches = [];
    matches.addAll(_countries);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> language = [
    'English',
    'Chinese',
    'Spanish',
    'Arabic',
    'Hindi',
    'Bengali',
    'Portuguese',
    'Russian',
    'German',
    'Japanese',
    'Javanese',
    'Lahnda',
    'Vietnamese',
    'Urdu',
    'Germany',
    'Urdu',
    'Urdu',
  ];

  List getSuggestions2(String query) {
    List matches = [];
    matches.addAll(language);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  Widget container_client() {
    return Container(
      height: h,
      width: w * 0.72,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xffFFFFFF).withOpacity(0.6),
                Color(0xffF3F3F3).withOpacity(0.36),
              ],
            ),
            // color: Colors.red,
          ),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin: EdgeInsets.only(left: 15, top: 10),
                        child: Text("Update Profile",
                            style: headingStyle18SBblack())),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Icon(
                          Icons.close,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text("Name", style: headingStyle16NBLightGrey())),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  // width: 500,
                  child: TextFormField(
                    initialValue: "", // autofocus: false,
                    // maxLines: 3,
                    onChanged: (v) {},
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
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text("Profile", style: headingStyle16NBLightGrey())),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  // width: 500,
                  child: TextFormField(
                    initialValue: "", // autofocus: false,
                    // maxLines: 3,
                    onChanged: (v) {},
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
                        hintText: "Profile",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text("Mobile Number",
                        style: headingStyle16NBLightGrey())),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  // width: 500,
                  child: TextFormField(
                    initialValue: "", // autofocus: false,
                    // maxLines: 3,
                    onChanged: (v) {},
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
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text("Email", style: headingStyle16NBLightGrey())),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  // width: 500,
                  child: TextFormField(
                    enabled: false,

                    initialValue: "", // autofocus: false,
                    // maxLines: 3,
                    onChanged: (v) {},
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
                        hintText: "Shishank.barua@gmail.com",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Country",
                    style: TextStyle(color: Color(0xff718096)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TypeAheadField(
                  hideSuggestionsOnKeyboardHide: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: this.controller,
                    onChanged: (university) {},
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
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
                        hintText: 'Select Country',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  suggestionsCallback: (v) {
                    return getSuggestions("$v");
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  // noItemsFoundBuilder: (context) => Container(
                  //   height: 100,
                  //   child: Center(
                  //     child: Text(
                  //       'Do you want to add this name',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  onSuggestionSelected: (suggestion) {
                    this.controller.text = suggestion.toString();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Text(
                    "Language",
                    style: TextStyle(color: Color(0xff718096)),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: TypeAheadField(
                  hideSuggestionsOnKeyboardHide: false,
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: this.languagectrl,
                    onChanged: (university) {},
                    decoration: InputDecoration(
                        fillColor: Color(0xffF5F6FA),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffF5F6FA)),
                        ),
                        focusedBorder: new OutlineInputBorder(
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
                        hintText: 'Select Country',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                  suggestionsCallback: (v) {
                    return getSuggestions2("$v");
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion.toString()),
                    );
                  },
                  transitionBuilder: (context, suggestionsBox, controller) {
                    return suggestionsBox;
                  },
                  // noItemsFoundBuilder: (context) => Container(
                  //   height: 100,
                  //   child: Center(
                  //     child: Text(
                  //       'Do you want to add this name',
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //   ),
                  // ),
                  onSuggestionSelected: (suggestion) {
                    this.languagectrl.text = suggestion.toString();
                  },
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xff1A494F)),
                    margin: EdgeInsets.only(left: 15, top: 15),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ],
          )),
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
          child: AccountantSideBar(),
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
            Row(
              children: [
                // MainAxisAlignment:main
                Container(
                  margin: EdgeInsets.only(top: 20, right: 10, left: 15),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shishank Barua",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                ),
                Spacer(),

                InkWell(
                  onTap: () {
                    // setState(() {
                    //   onEdit = true;
                    // });
                    showDialog(
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.only(
                                left: 100,
                                // top: 250,
                                top: 80),
                            child: AlertDialog(
                              backgroundColor: Colors.white,
                              content: container_client(),
                            ),
                          );
                        });
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.grey,
                      )),
                ),
              ],
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
