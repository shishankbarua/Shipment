import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/component/Res_Client/ClienSubmitReview.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ClientReview extends StatefulWidget {
  const ClientReview({Key? key}) : super(key: key);

  @override
  _ClientReviewState createState() => _ClientReviewState();
}

class _ClientReviewState extends State<ClientReview> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;

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
          height: h,
          color: Color(0xffF5F6F8),
          child: SafeArea(
              child: ListView(
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
                            'Review and rating > ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'COSCO – China Ocean Shipping Company ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
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
                  children: [topBar(), reivewList(), buttons()],
                ),
              if (Responsive.isDesktop(context))
                Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    width: w,
                    height: h,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Container(
                          width: w * 0.5,
                          child: reivewList(),
                        ),
                        // Spacer(),
                        Container(
                          width: w * 0.2,
                          child: buttons(),
                        )
                      ],
                    )),
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

  Widget reivewList() {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black),
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffFFFFFF),
          ),
          margin: EdgeInsets.only(left: 24, top: 15, right: 10),
          // height: h * 0,
          width: w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      child: Image.asset('assets/images/Ellipse7.png'),
                      height: 75,
                      width: 50),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Text("Jane Cooper",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          child: Text("1 Feb, 2020",
                              style: TextStyle(
                                color: Color(0xff90A0B7),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  if (Responsive.isDesktop(context))
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // width: w * 0.20,
                            child: Row(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.star_border,
                                      size: 20,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.star_border,
                                      size: 20,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.star_border,
                                      size: 20,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Icon(
                                      Icons.star_border,
                                      size: 20,
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 5, right: 10),
                                    child: Icon(
                                      Icons.star_border,
                                      size: 20,
                                    )),
                              ],
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.only(right: 10, left: 10),
                          //   child: Text("4.0",
                          //       style: TextStyle(
                          //         color: Color(0xff90A0B7),
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 10,
                          //       )),
                          // ),
                        ],
                      ),
                    ),
                ],
              ),
              if (Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // width: w * 0.20,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.star_border,
                                  size: 20,
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.star_border,
                                  size: 20,
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.star_border,
                                  size: 20,
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.star_border,
                                  size: 20,
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 5, right: 10),
                                child: Icon(
                                  Icons.star_border,
                                  size: 20,
                                )),
                          ],
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 10, left: 10),
                      //   child: Text("4.0",
                      //       style: TextStyle(
                      //         color: Color(0xff90A0B7),
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 10,
                      //       )),
                      // ),
                    ],
                  ),
                ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                    "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.  Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum. ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buttons() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xffE1B400)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 15),

                    // width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.lime,
                    child: Center(
                        child: Text("Share Review",
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ClinetSubmitReview()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 15, right: 20, bottom: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xff1A494F)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(15, 15, 0, 15),

                    // width: MediaQuery.of(context).size.width * 0.8,
                    // color: Colors.lime,
                    child: Center(
                        child: Text("Respond",
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
      ],
    );
  }
}
