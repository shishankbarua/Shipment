import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF5F6F8),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Orders",
                      style: headingStyle25blackbold(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 650),
                      child: Container(
                        height: 48,
                        width: 349,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
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
                        width: 136,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: Colors.teal, width: 2.0)))),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 39,
                  right: 40,
                  top: 33,
                ),
                child: Container(
                  height: 500,
                  width: 1105,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Orders placed",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 143),
                              child: Text(
                                "Total",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 126),
                              child: Text(
                                "Ship To",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 459),
                              child: Text(
                                "Order #123456",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Oct 27, 2021",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 147),
                              child: Text(
                                "\$220.00",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text(
                                "Acme Corp, Stresemannstr. 70, Saarlouis, Germany",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 133),
                              child: Text(
                                "Order Details",
                                style: headingStyle18blackw500(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Container(
                          height: 326,
                          width: 1105,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Container(
                                    height: 175,
                                    width: 287,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Image.asset("images/BMW.png")),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 95),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 21),
                                          child: Text(
                                            "BMW cars",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 210),
                                          child: SizedBox(
                                            width: 117,
                                            height: 15,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      27.0),
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xffE6E7E8),
                                                              width: 2.0)))),
                                              child: Text(
                                                'Shipped on 12.11.19',
                                                style: headingStyle8tealw400(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 320, top: 38),
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Cars",
                                              style: headingStyle14blackw400(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xffEFEFEF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              height: 31,
                                              width: 31,
                                              child: Center(
                                                child: Text("3",
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 11),
                                          child: Text(
                                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do \namet sint. Velit officia consequat duis enim velit mollit. ",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 80, top: 95),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 144,
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff1A494F)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ))),
                                        child: Text(
                                          'Accept',
                                          style: headingStyle14whitew500(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: SizedBox(
                                        width: 144,
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xffFFFFFF)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ))),
                                          child: Text(
                                            'Reject',
                                            style: headingStyle14blackw500(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 23),
                                      child: Container(
                                        height: 36,
                                        width: 38,
                                        child: Image.asset("images/cloc.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "03:56 hr",
                                        style: headingStyle24blackw500(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Time left",
                                        style: headingStyle14blackw500(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 43),
                              child: Text(
                                "Estimated Delivery:",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                "Out 15 2021",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 39,
                  right: 40,
                  top: 33,
                ),
                child: Container(
                  height: 500,
                  width: 1105,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Orders placed",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 143),
                              child: Text(
                                "Total",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 126),
                              child: Text(
                                "Ship To",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 459),
                              child: Text(
                                "Order #123456",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Oct 27, 2021",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 147),
                              child: Text(
                                "\$220.00",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text(
                                "Acme Corp, Stresemannstr. 70, Saarlouis, Germany",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 133),
                              child: Text(
                                "Order Details",
                                style: headingStyle18blackw500(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Container(
                          height: 326,
                          width: 1105,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Container(
                                    height: 175,
                                    width: 287,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Image.asset("images/BMW.png")),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 95),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 21),
                                          child: Text(
                                            "BMW cars",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 210),
                                          child: SizedBox(
                                            width: 117,
                                            height: 15,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      27.0),
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xffE6E7E8),
                                                              width: 2.0)))),
                                              child: Text(
                                                'Shipped on 12.11.19',
                                                style: headingStyle8tealw400(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 320, top: 38),
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Cars",
                                              style: headingStyle14blackw400(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xffEFEFEF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              height: 31,
                                              width: 31,
                                              child: Center(
                                                child: Text("3",
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 11),
                                          child: Text(
                                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do \namet sint. Velit officia consequat duis enim velit mollit. ",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 80, top: 95),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 144,
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff1A494F)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ))),
                                        child: Text(
                                          'Accept',
                                          style: headingStyle14whitew500(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: SizedBox(
                                        width: 144,
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xffFFFFFF)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ))),
                                          child: Text(
                                            'Reject',
                                            style: headingStyle14blackw500(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 23),
                                      child: Container(
                                        height: 36,
                                        width: 38,
                                        child: Image.asset("images/cloc.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "03:56 hr",
                                        style: headingStyle24blackw500(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Time left",
                                        style: headingStyle14blackw500(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 43),
                              child: Text(
                                "Estimated Delivery:",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                "Out 15 2021",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 39,
                  right: 40,
                  top: 33,
                ),
                child: Container(
                  height: 500,
                  width: 1105,
                  decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 29),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Orders placed",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 143),
                              child: Text(
                                "Total",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 126),
                              child: Text(
                                "Ship To",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 459),
                              child: Text(
                                "Order #123456",
                                style: headingStyle12blackw400(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                "Oct 27, 2021",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 147),
                              child: Text(
                                "\$220.00",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text(
                                "Acme Corp, Stresemannstr. 70, Saarlouis, Germany",
                                style: headingStyle14blackw500(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 133),
                              child: Text(
                                "Order Details",
                                style: headingStyle18blackw500(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Container(
                          height: 326,
                          width: 1105,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Container(
                                    height: 175,
                                    width: 287,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Image.asset("images/BMW.png")),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 95),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 21),
                                          child: Text(
                                            "BMW cars",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 210),
                                          child: SizedBox(
                                            width: 117,
                                            height: 15,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.white),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      27.0),
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xffE6E7E8),
                                                              width: 2.0)))),
                                              child: Text(
                                                'Shipped on 12.11.19',
                                                style: headingStyle8tealw400(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 320, top: 38),
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
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              "Cars",
                                              style: headingStyle14blackw400(),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color(0xffEFEFEF),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                              height: 31,
                                              width: 31,
                                              child: Center(
                                                child: Text("3",
                                                    style: TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, top: 11),
                                          child: Text(
                                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do \namet sint. Velit officia consequat duis enim velit mollit. ",
                                            style: headingStyle18blackw500(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 80, top: 95),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: 144,
                                      height: 36,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Color(0xff1A494F)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ))),
                                        child: Text(
                                          'Accept',
                                          style: headingStyle14whitew500(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: SizedBox(
                                        width: 144,
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xffFFFFFF)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ))),
                                          child: Text(
                                            'Reject',
                                            style: headingStyle14blackw500(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 23),
                                      child: Container(
                                        height: 36,
                                        width: 38,
                                        child: Image.asset("images/cloc.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        "03:56 hr",
                                        style: headingStyle24blackw500(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Time left",
                                        style: headingStyle14blackw500(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 43),
                              child: Text(
                                "Estimated Delivery:",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 9),
                              child: Text(
                                "Out 15 2021",
                                style: headingStyle14blackw400(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
