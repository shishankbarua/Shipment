import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:intl/intl.dart';

import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Provider/Provider.dart';
import 'package:shipment/component/Res_Client/GoodsInfo.dart';

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

  final TextEditingController _datecontrollr = new TextEditingController();
  final TextEditingController receptionistName = TextEditingController();
  final TextEditingController _emails = TextEditingController();

  final TextEditingController _contactnumber = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final TextEditingController _timecontrollr = new TextEditingController();
  TextEditingController pickUpTextEditingController = TextEditingController();

  DateTime _startDate = DateTime.now();

  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;

  TimeOfDay initialTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: initialTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != initialTime) {
      setState(() {
        initialTime = timeOfDay;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    builder:
    (context, child) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Container(
              height: 100,
              width: 100,
              child: child,
            ),
          ),
        ],
      );
    };
  }

  List<String> itemList = [];

  List getSuggestions(String query) {
    List matches = [];
    matches.addAll(itemList);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> emailList = [];

  List getSuggestions2(String query) {
    List matches = [];
    matches.addAll(emailList);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> contactList = [];

  List getSuggestions3(String query) {
    List matches = [];
    matches.addAll(contactList);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> addressList = [];

  List getSuggestions4(String query) {
    List matches = [];
    matches.addAll(addressList);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
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
                LimitedBox(
                  maxWidth: 300,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GoodsInfo()));
                    },
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(
                          top: 15, left: 15, right: 20, bottom: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xff1F2326)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.all(15),

                              // width: MediaQuery.of(context).size.width * 0.8,
                              // color: Colors.lime,
                              child: Center(
                                  child: Text("Proceed to Payment",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      )))),
                          Container(
                            margin:
                                EdgeInsets.only(top: 15, right: 10, left: 30),
                            height: 30,
                            // width: 300,
                            child: Image.asset('assets/images/arrow-right.png'),
                          ),
                        ],
                      ),
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
          child: TypeAheadField(
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
              controller: this.receptionistName,
              onChanged: (university) {
                setState(() {
                  // universityName = university;
                });
                // print("object $universityName");
              },
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
                  hintText: "Enter Name",
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
              this.receptionistName.text = suggestion.toString();

              // print("universityName $universityName");
            },
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
          child: TypeAheadField(
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
              controller: this._emails,
              onChanged: (value) {},
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
                  hintText: "Enter email address",
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
              this._emails.text = suggestion.toString();

              // print("universityName $universityName");
            },
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
          child: TypeAheadField(
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
              controller: this._contactnumber,
              onChanged: (value) {},
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
                  hintText: "Shishank Barua",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
            suggestionsCallback: (v) {
              return getSuggestions3("$v");
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
              this._contactnumber.text = suggestion.toString();

              // print("universityName $universityName");
            },
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
          child: TypeAheadField(
            hideSuggestionsOnKeyboardHide: false,
            textFieldConfiguration: TextFieldConfiguration(
              controller: this._address,
              onChanged: (value) {},
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
                  hintText: "Shishank Barua",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
            suggestionsCallback: (v) {
              return getSuggestions4("$v");
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
              this._address.text = suggestion.toString();

              // print("universityName $universityName");
            },
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
              // findPlace(v);
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
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFFFFFF),
                        // border: Border.all(color:)
                      ),
                      child: Row(
                        children: [
                          new Expanded(
                            child: new TextField(
                                enabled: false,
                                controller: _datecontrollr,
                                decoration: InputDecoration(
                                    fillColor: Color(0xffF5F6FA),
                                    filled: true,
                                    // prefixIcon: Icon(Icons.search),
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
                                    hintText: 'Enter Start Date',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15))),
                          ),
                          IconButton(
                              onPressed: () async {
                                await _selectDate(context);
                                _datecontrollr.text = (DateFormat.yMd()
                                    .format(_startDate)
                                    .toString());
                                // _startDate.toString();
                              },
                              icon: ImageIcon(
                                AssetImage('assets/images/calendar.png'),
                                color: Color(0xff1F2326),
                                size: 65,
                              )),
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                    //   width: MediaQuery.of(context).size.width * (15 / 100),
                    //   child: TextFormField(
                    //     initialValue: "",
                    //     onChanged: (v) {
                    //       setState(() {
                    //         // userEmail = v.toLowerCase();
                    //       });
                    //     },
                    //     style: TextStyle(color: Colors.black54, fontSize: 17),
                    //     decoration: InputDecoration(
                    //         fillColor: Color(0xffF5F6FA),
                    //         filled: true,
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         focusedBorder: new OutlineInputBorder(
                    //           // borderRadius: new BorderRadius.circular(25.0),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         errorBorder: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(4)),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         focusedErrorBorder: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(4)),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         // border: InputBorder.none,
                    //         hintText: "10.08.2021",
                    //         hintStyle:
                    //             TextStyle(color: Colors.grey, fontSize: 15)),
                    //   ),
                    // ),
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
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFFFFFF),
                        // border: Border.all(color:)
                      ),
                      child: Row(
                        children: [
                          new Expanded(
                            child: new TextField(
                                enabled: false,
                                controller: _timecontrollr,
                                decoration: InputDecoration(
                                    fillColor: Color(0xffF5F6FA),
                                    filled: true,
                                    // prefixIcon: Icon(Icons.search),
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
                                    hintText: 'Enter Time',
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15))),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _selectTime(context);
                              _timecontrollr.text =
                                  ("${initialTime.hour}:${initialTime.minute}")
                                      .toString();
                              // _startDate.toString();
                            },
                            icon: Icon(Icons.access_alarm, size: 30),
                            color: Color(0xff1F2326),
                          ),
                        ],
                      ),
                    ),

                    // Container(
                    //   margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                    //   width: MediaQuery.of(context).size.width * (15 / 100),
                    //   child: TextFormField(
                    //     initialValue: "",
                    //     onChanged: (v) {
                    //       setState(() {
                    //         // userEmail = v.toLowerCase();
                    //       });
                    //     },
                    //     style: TextStyle(color: Colors.black54, fontSize: 17),
                    //     decoration: InputDecoration(
                    //         fillColor: Color(0xffF5F6FA),
                    //         filled: true,
                    //         enabledBorder: OutlineInputBorder(
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         focusedBorder: new OutlineInputBorder(
                    //           // borderRadius: new BorderRadius.circular(25.0),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         errorBorder: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(4)),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         focusedErrorBorder: OutlineInputBorder(
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(4)),
                    //           borderSide: BorderSide(
                    //               width: 1.2, color: Color(0xffF5F6FA)),
                    //         ),
                    //         // border: InputBorder.none,
                    //         hintText: "10 AM",
                    //         hintStyle:
                    //             TextStyle(color: Colors.grey, fontSize: 15)),
                    //   ),
                    // ),
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
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFFFFFF),
                  // border: Border.all(color:)
                ),
                child: Row(
                  children: [
                    new Expanded(
                      child: new TextField(
                          enabled: false,
                          controller: _datecontrollr,
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              // prefixIcon: Icon(Icons.search),
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
                              hintText: 'Enter Start Date',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                    ),
                    IconButton(
                        onPressed: () async {
                          await _selectDate(context);
                          _datecontrollr.text =
                              (DateFormat.yMd().format(_startDate).toString());
                          // _startDate.toString();
                        },
                        icon: ImageIcon(
                          AssetImage('assets/images/calendar.png'),
                          color: Color(0xff1F2326),
                          size: 65,
                        )),
                  ],
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
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFFFFFF),
                  // border: Border.all(color:)
                ),
                child: Row(
                  children: [
                    new Expanded(
                      child: new TextField(
                          enabled: false,
                          controller: _timecontrollr,
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              // prefixIcon: Icon(Icons.search),
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
                              hintText: 'Enter Time',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                    ),
                    IconButton(
                      onPressed: () async {
                        await _selectTime(context);
                        _timecontrollr.text =
                            ("${initialTime.hour}:${initialTime.minute}")
                                .toString();
                        // _startDate.toString();
                      },
                      icon: Icon(Icons.access_alarm, size: 30),
                      color: Color(0xff1F2326),
                    ),
                  ],
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
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFFFFFF),
                  // border: Border.all(color:)
                ),
                child: Row(
                  children: [
                    new Expanded(
                      child: new TextField(
                          enabled: false,
                          controller: _datecontrollr,
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              // prefixIcon: Icon(Icons.search),
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
                              hintText: 'Enter Start Date',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                    ),
                    IconButton(
                        onPressed: () async {
                          await _selectDate(context);
                          _datecontrollr.text =
                              (DateFormat.yMd().format(_startDate).toString());
                          // _startDate.toString();
                        },
                        icon: ImageIcon(
                          AssetImage('assets/images/calendar.png'),
                          color: Color(0xff1F2326),
                          size: 65,
                        )),
                  ],
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
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xffFFFFFF),
                  // border: Border.all(color:)
                ),
                child: Row(
                  children: [
                    new Expanded(
                      child: new TextField(
                          enabled: false,
                          controller: _timecontrollr,
                          decoration: InputDecoration(
                              fillColor: Color(0xffF5F6FA),
                              filled: true,
                              // prefixIcon: Icon(Icons.search),
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
                              hintText: 'Enter Time',
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15))),
                    ),
                    IconButton(
                      onPressed: () async {
                        await _selectTime(context);
                        _timecontrollr.text =
                            ("${initialTime.hour}:${initialTime.minute}")
                                .toString();
                        // _startDate.toString();
                      },
                      icon: Icon(Icons.access_alarm, size: 30),
                      color: Color(0xff1F2326),
                    ),
                  ],
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
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFFFFFF),
                          // border: Border.all(color:)
                        ),
                        child: Row(
                          children: [
                            new Expanded(
                              child: new TextField(
                                  enabled: false,
                                  controller: _datecontrollr,
                                  decoration: InputDecoration(
                                      fillColor: Color(0xffF5F6FA),
                                      filled: true,
                                      // prefixIcon: Icon(Icons.search),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffF5F6FA)),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffF5F6FA)),
                                      ),
                                      hintText: 'Enter Start Date',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15))),
                            ),
                            IconButton(
                                onPressed: () async {
                                  await _selectDate(context);
                                  _datecontrollr.text = (DateFormat.yMd()
                                      .format(_startDate)
                                      .toString());
                                  // _startDate.toString();
                                },
                                icon: ImageIcon(
                                  AssetImage('assets/images/calendar.png'),
                                  color: Color(0xff1F2326),
                                  size: 65,
                                )),
                          ],
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
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFFFFFF),
                          // border: Border.all(color:)
                        ),
                        child: Row(
                          children: [
                            new Expanded(
                              child: new TextField(
                                  enabled: false,
                                  controller: _timecontrollr,
                                  decoration: InputDecoration(
                                      fillColor: Color(0xffF5F6FA),
                                      filled: true,
                                      // prefixIcon: Icon(Icons.search),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffF5F6FA)),
                                      ),
                                      focusedBorder: new OutlineInputBorder(
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            width: 1.2,
                                            color: Color(0xffF5F6FA)),
                                      ),
                                      hintText: 'Enter Time',
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15))),
                            ),
                            IconButton(
                              onPressed: () async {
                                await _selectTime(context);
                                _timecontrollr.text =
                                    ("${initialTime.hour}:${initialTime.minute}")
                                        .toString();
                                // _startDate.toString();
                              },
                              icon: Icon(Icons.access_alarm, size: 30),
                              color: Color(0xff1F2326),
                            ),
                          ],
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
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFFFFFF),
                    // border: Border.all(color:)
                  ),
                  child: Row(
                    children: [
                      new Expanded(
                        child: new TextField(
                            enabled: false,
                            controller: _datecontrollr,
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                // prefixIcon: Icon(Icons.search),
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
                                hintText: 'Enter Start Date',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                      ),
                      IconButton(
                          onPressed: () async {
                            await _selectDate(context);
                            _datecontrollr.text = (DateFormat.yMd()
                                .format(_startDate)
                                .toString());
                            // _startDate.toString();
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/calendar.png'),
                            color: Color(0xff1F2326),
                            size: 65,
                          )),
                    ],
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
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFFFFFF),
                    // border: Border.all(color:)
                  ),
                  child: Row(
                    children: [
                      new Expanded(
                        child: new TextField(
                            enabled: false,
                            controller: _timecontrollr,
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                // prefixIcon: Icon(Icons.search),
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
                                hintText: 'Enter Time',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                      ),
                      IconButton(
                        onPressed: () async {
                          await _selectTime(context);
                          _timecontrollr.text =
                              ("${initialTime.hour}:${initialTime.minute}")
                                  .toString();
                          // _startDate.toString();
                        },
                        icon: Icon(Icons.access_alarm, size: 30),
                        color: Color(0xff1F2326),
                      ),
                    ],
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
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFFFFFF),
                    // border: Border.all(color:)
                  ),
                  child: Row(
                    children: [
                      new Expanded(
                        child: new TextField(
                            enabled: false,
                            controller: _datecontrollr,
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                // prefixIcon: Icon(Icons.search),
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
                                hintText: 'Enter Start Date',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                      ),
                      IconButton(
                          onPressed: () async {
                            await _selectDate(context);
                            _datecontrollr.text = (DateFormat.yMd()
                                .format(_startDate)
                                .toString());
                            // _startDate.toString();
                          },
                          icon: ImageIcon(
                            AssetImage('assets/images/calendar.png'),
                            color: Color(0xff1F2326),
                            size: 65,
                          )),
                    ],
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
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffFFFFFF),
                    // border: Border.all(color:)
                  ),
                  child: Row(
                    children: [
                      new Expanded(
                        child: new TextField(
                            enabled: false,
                            controller: _timecontrollr,
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                // prefixIcon: Icon(Icons.search),
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
                                hintText: 'Enter Time',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15))),
                      ),
                      IconButton(
                        onPressed: () async {
                          await _selectTime(context);
                          _timecontrollr.text =
                              ("${initialTime.hour}:${initialTime.minute}")
                                  .toString();
                          // _startDate.toString();
                        },
                        icon: Icon(Icons.access_alarm, size: 30),
                        color: Color(0xff1F2326),
                      ),
                    ],
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
