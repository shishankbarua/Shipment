import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/CustomAlertDialog.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Shipment.dart/Shipment_Sidebar.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SubmitProposal extends StatefulWidget {
  const SubmitProposal({Key? key}) : super(key: key);

  @override
  _SubmitProposalState createState() => _SubmitProposalState();
}

class _SubmitProposalState extends State<SubmitProposal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
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
        child: ShipmentSidebar(),
      ),
      body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          color: Color(0xffF7F8F9),
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
                          margin: EdgeInsets.fromLTRB(5, 10, 50, 0),
                          child: Row(
                            children: [
                              Text(
                                'Market Place > Submit a proposal',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Spacer(),
                              if (Responsive.isDesktop(context)) topBar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!Responsive.isDesktop(context))
                    Column(
                      children: [
                        topBar(),
                        proposalSetting(),
                        bookingDetails(),
                        terms(),
                        additionalDetails(),
                        buttons(),
                      ],
                    ),
                  if (Responsive.isDesktop(context))
                    Column(
                      children: [
                        proposalSetting(),
                        bookingDetails(),
                        terms(),
                        additionalDetails(),
                        buttons(),
                      ],
                    ),
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

  Widget proposalSetting() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      margin: EdgeInsets.only(left: 24, top: 15, right: 10),
      height: h * 0.38,
      width: w,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Proposal Settings",
                style: headingStyleAppColor18MB(),
              ),
            ),
          ),
          Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
            color: Colors.grey,
            height: 36,
          )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Propose with a Specialized profile",
                style: headingStyleNormal(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 500,
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
                "This proposal requires XYZ",
                style: headingStyleNormal(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "When you submit this proposal, you'll have XYZ remaining.",
                style: headingStyleNormal(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bookingDetails() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      margin: EdgeInsets.only(left: 24, top: 15, right: 10),
      height: h * 0.70,
      width: w,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Booking Details",
                style: headingStyleAppColor18MB(),
              ),
            ),
          ),
          Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
            color: Colors.grey,
            height: 36,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w * 0.30,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "BMW Cars",
                          style: headingStyleNormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Posted 08 Oct, 2021",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 400,
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                          overflow: (!Responsive.isDesktop(context))
                              ? TextOverflow.ellipsis
                              : TextOverflow.visible,
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, left: 10),
                        child: Text(
                          "Best Wishes",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Shishank Barua",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Shishank.barua@gmail.com",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "View Job Posting",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: VerticalDivider(
                color: Colors.grey,
              )),
              Container(
                width: w * 0.20,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          // height: 150,
                          // width: 300,
                          decoration: BoxDecoration(
                            // border: Border.all(

                            //     width: 0.5, color: Color(0xffACACAC)),
                            // borderRadius: BorderRadius.circular(0.0),
                            color: Color(0xffFFFFFF),
                          ),
                          margin: EdgeInsets.only(top: 32, right: 10, left: 20),
                          child: Image.asset(
                            'assets/images/Cars.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
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
                                margin: EdgeInsets.only(left: 5, top: 22),
                                child: Text("Cars")),
                            Container(
                                height: 30,
                                width: 30,
                                margin: EdgeInsets.only(left: 10, top: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    color: Color(0xffEFEFEF)),
                                child: Center(child: Text("3"))),
                          ]),
                    ),
                    GestureDetector(
                      onTap: () {
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
                                  content: summaryBox(),
                                ),
                              );
                            });
                      },
                      child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Color(0xff1A494F)),
                          margin: EdgeInsets.only(left: 15, top: 15, right: 15),
                          child: Center(
                            child: Text(
                              "See Booking Summary",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget terms() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        margin: EdgeInsets.only(left: 24, top: 15, right: 10),
        height: h * 0.70,
        width: w,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Terms",
                    style: headingStyleAppColor18MB(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: Text(
                    "Client's budget: 200.00 USD",
                    style: headingStyleAppColor18MB(),
                  ),
                ),
              ),
            ],
          ),
          Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
            color: Colors.grey,
            height: 36,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: w * 0.50,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "What is the rate you'd like to bid for this job?",
                          style: headingStyleNormal(),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          "Your Shipment profile rate: 100.00",
                          style: headingStyle16blacknormal(),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Shipping Price",
                                  style: headingStyle16blacknormal(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Total amount the client will see on your proposal",
                                  overflow: (!Responsive.isDesktop(context))
                                      ? TextOverflow.ellipsis
                                      : TextOverflow.visible,
                                  style: headingStyleAppColor14MB(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            width: (Responsive.isDesktop(context))
                                ? 200
                                : w * 0.30,
                            child: TextFormField(
                              initialValue: "", // autofocus: false,
                              // maxLines: 3,
                              onChanged: (v) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
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
                                  hintText: "250",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                      color: Colors.grey,
                      height: 36,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            child: Text(
                              "Tax",
                              style: headingStyle16blacknormal(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 200,
                            child: TextFormField(
                              initialValue: "", // autofocus: false,
                              // maxLines: 3,
                              onChanged: (v) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
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
                                  hintText: "20",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                      color: Colors.grey,
                      height: 36,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "Pick-up Fee",
                                  style: headingStyle16blacknormal(),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  "The estimated amount you'll receive after service fees",
                                  style: headingStyleAppColor14MB(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 200,
                            child: TextFormField(
                              initialValue: "", // autofocus: false,
                              // maxLines: 3,
                              onChanged: (v) {},
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 17),
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
                                  hintText: "10",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  child: VerticalDivider(
                color: Colors.grey,
              )),
              Container(
                width: w * 0.20,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      // height: 150,
                      // width: 300,
                      decoration: BoxDecoration(
                        // border: Border.all(

                        //     width: 0.5, color: Color(0xffACACAC)),
                        // borderRadius: BorderRadius.circular(0.0),
                        color: Color(0xffFFFFFF),
                      ),
                      margin: EdgeInsets.only(top: 32, right: 10, left: 20),
                      child: Image.asset(
                        'assets/images/Frame.png',
                        fit: BoxFit.cover,
                      )),
                ),
              )
            ],
          ),
        ]));
  }

  Widget additionalDetails() {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffFFFFFF),
        ),
        margin: EdgeInsets.only(left: 24, top: 15, right: 10),
        height: (Responsive.isDesktop(context)) ? h * 0.80 : h * 0.85,
        width: w,
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Additional details",
                style: headingStyleAppColor18MB(),
              ),
            ),
          ),
          Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
            color: Colors.grey,
            height: 36,
          )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Additional Note",
                style: headingStyle16blacknormal(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Introduce yourself and explain why you’re a strong candidate for this job. Feel free to suggest any changes to the job details or ask to schedule a video call.",
                style: headingStyle16blacknormal(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: TextFormField(
              initialValue: "",
              autofocus: false,
              maxLines: 3,
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
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
          Container(
              // margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
            color: Colors.grey,
            height: 36,
          )),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Attachments",
                style: headingStyle16blacknormal(),
              ),
            ),
          ),
          DottedBorder(
            padding: EdgeInsets.only(top: 10, left: 10),
            color: Colors.black,
            strokeWidth: 1,
            child: Container(
              width: w,
              height: h * 0.10,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(0.0),
              //   color: Color(0xffE5E5E5),
              // ),
              child: Center(
                child: Text(
                  'drag or upload project files',
                  style: headingStyle16blacknormal(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "You may attach up to 10 files under the size of 25MB each. Include work samples or other documents to support your application. Do not attach your résumé — your Upwork profile is automatically forwarded to the client with your proposal.",
                style: headingStyle16blacknormal(),
              ),
            ),
          ),
        ]));
  }

  Widget buttons() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Color(0xff1F2326)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 0, 15),

                      // width: MediaQuery.of(context).size.width * 0.8,
                      // color: Colors.lime,
                      child: Center(
                          child: Text("Send Proposal",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              )))),
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 10, left: 30),
                    height: 30,
                    // width: 300,
                    child: Image.asset('assets/images/arrow-right.png'),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: 100,
              height: 60,
              margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  // border: Border.all(color: Colors.black),
                  color: Colors.red),
              child: Center(
                  child: Text("Reject",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ))),
            ),
          ),
        ],
      ),
    );
  }

  Widget summaryBox() {
    return Container(
      height: MediaQuery.of(context).size.height * (80 / 100),
      // height: 100,
      width: (Responsive.isDesktop(context))
          ? MediaQuery.of(context).size.width * (38 / 100)
          : MediaQuery.of(context).size.width * (90 / 100),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),

      child: ListView(
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
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Price summary",
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Item 1",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                  String.fromCharCodes(new Runes('\u0024')) + "BMW Cars",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "3",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "210.00",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Item 2",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "4",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "210.00",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "17",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "250",
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
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "687",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 10, left: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Amet minim mollit non deserunt ullamco.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "-40.00",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, right: 10, left: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Amet minim mollit non deserunt ullamco.",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "20.00",
                  style: TextStyle(
                    fontSize: 14,
                  ),
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, right: 10, left: 15),
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
                  String.fromCharCodes(new Runes('\u0024')) + "667.00",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
