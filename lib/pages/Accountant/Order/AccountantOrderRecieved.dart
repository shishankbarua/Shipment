import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/component/Accountant/AccountSidebar.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class AccountantOrderRecieved extends StatefulWidget {
  const AccountantOrderRecieved({Key? key}) : super(key: key);

  @override
  _AccountantOrderRecievedState createState() =>
      _AccountantOrderRecievedState();
}

class _AccountantOrderRecievedState extends State<AccountantOrderRecieved> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? selectedDate = DateTime.now();
  var h, w;
  int? _radioValue = 0;

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
                      if (Responsive.isDesktop(context)) SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 10, 50, 0),
                        child: Row(
                          children: [
                            Text(
                              'Dashboard > Container',
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
                    children: [
                      topBar(),
                    ],
                  ),
                if (Responsive.isDesktop(context)) offerRecieved(),
              ])),
        ));
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

  Widget offerRecieved() {
    return ListView.builder(
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            // height: 80,
            width: w,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Colors.black),
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Color(0xffACACAC)),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xffE5E5E5),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              width: 200,
                              child: Text(
                                "Orders placed",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10),
                              width: 200,
                              child: Text(
                                "Oct 27, 2021",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Spacer(),
                      // SizedBox(
                      //   width: 70,
                      // ),
                      Column(
                        children: [
                          Container(
                              width: 200,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Total",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 200,
                              child: Text(
                                "227.00",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Container(
                              width: 400,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Ship To",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              width: 400,
                              child: Text(
                                "Acme Corp, Stresemannstr. 70, Saarlouis, Germany",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Spacer(),

                      Column(
                        children: [
                          Container(
                              width: 200,
                              margin: EdgeInsets.only(right: 0, top: 10),
                              child: Text(
                                "Order 12345",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                          Container(
                              width: 200,
                              margin: EdgeInsets.only(
                                  right: 0, top: 10, bottom: 10),
                              child: Text(
                                "Order Details",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            // border: Border.all(

                            //     width: 0.5, color: Color(0xffACACAC)),
                            // borderRadius: BorderRadius.circular(0.0),
                            color: Color(0xffFFFFFF),
                          ),
                          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
                          child: Image.asset(
                            'assets/images/Cars.png',
                            fit: BoxFit.cover,
                          )),
                      secondRow2(),
                      Spacer(),
                      thirdRow2(),
                    ],
                  ),
                ),
                Container(
                    height: 80,
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xffACACAC)),
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xffE5E5E5),
                    ),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            width: 200,
                            child: Text(
                              "Estimated Delivery:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Container(
                            margin: EdgeInsets.only(left: 5, top: 10),
                            width: 200,
                            child: Text(
                              "Oct 15,2021",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )),
              ],
            ),
          );
        });
  }

  Widget secondRow2() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text(
                    "BMW Cars",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
              Container(
                  height: 40,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Color(0xffE6E7E8)),
                  margin: EdgeInsets.only(left: 15, top: 15),
                  child: Center(
                    child: Text(
                      "Shipped on 12.11.19",
                      style: TextStyle(
                          color: Color(0xff1A494F),
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              // Spacer(),
              //
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 5),
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
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Text("Cars")),
                  Container(
                      height: 30,
                      width: 30,
                      margin: EdgeInsets.only(left: 10, top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Color(0xffEFEFEF)),
                      child: Center(child: Text("3"))),
                ]),
          ),
          Container(
              width: 300,
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              )),
        ],
      ),
    );
  }

  Widget thirdRow2() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => new AlertDialog(
                // title: new Text('Are you sure?'),
                content: new Text(
                  'Are you sure  you want to accept this offer?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color(0xffFF0000)),
                        height: 40,
                        width: 150,
                        child: Center(
                            child: new Text(
                          'Reject',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                  new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.black),
                        height: 40,
                        width: 150,
                        child: Center(
                            child: new Text(
                          'Accept',
                          style: TextStyle(color: Colors.white),
                        ))),
                  ),
                ],
              ),
            );
          },
          child: Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  color: Color(0xff1A494F)),
              margin: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Center(
                child: Text(
                  "Accept",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )),
        ),
        Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(width: 0.5, color: Color(0xffACACAC)),
                color: Color(0xffFFFFFF)),
            margin: EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Center(
              child: Text(
                "Reject",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )),
      ],
    );
  }
}
