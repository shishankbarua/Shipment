import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
import 'package:shipment/pages/Client/Dashboard/Payment.dart';
import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
import 'package:shipment/pages/Client/Profile.dart';
import 'package:shipment/pages/Client/Transactions/Transactions.dart';

class GoodsInfo extends StatefulWidget {
  const GoodsInfo({Key? key}) : super(key: key);

  @override
  _GoodsInfoState createState() => _GoodsInfoState();
}

class _GoodsInfoState extends State<GoodsInfo> {
  bool _value = false;
  List image = [];
  int? val = -1;
  var h, w;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  List<Widget> _cardList = [];

  List<String> _countries = [
    'Car',
    'BOX',
    'TV',
    'Bike',
    'AC',
    'MObile',
    'Laptop',
    'Moniter',
    'Desktop',
  ];

  DateTime? selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate!, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  var item;
  _showDialogOnButtonPressing() => showDialog(
        context: context,
        builder: (context) => new Container(
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.height - 60,
          child: Dialog(
            child: ListView.builder(
                itemCount: _countries.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item = _countries[index];
                        Navigator.pop(context);
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomePage()));
                      });
                    },
                    child: ListTile(
                      title: Text('${_countries[index]}'),
                    ),
                  );
                }),
          ),
        ),
      );

  _openCamera(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image.add(_image);
      Navigator.of(context).pop();
    });
  }

  Widget sideBar() {
    return Container(
      height: h,
      width: exp ? w * 0.2 : w * 0.1,
      color: Color(0xffFFFFFF),
      child: exp
          ? Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: Container(
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
                                child:
                                    Image.asset('assets/images/Ellipse7.png'),
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
                ),
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
                    child: ListView(children: [
                      Column(children: [
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                              child: Text(
                                'Dashboard > Cosco >Pickup / Drop Off > Goods info',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                              height: 35,
                              width: MediaQuery.of(context).size.width *
                                  (10 / 100),
                              child: TextFormField(
                                initialValue: '',
                                onChanged: (value) {},
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 17),
                                decoration: InputDecoration(
                                    fillColor: Color(0xffFFFFFF),
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.2, color: Color(0xffFFFFFF)),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      // borderRadius: new BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          width: 1.2, color: Color(0xffFFFFFF)),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.2, color: Color(0xffFFFFFF)),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1.2, color: Color(0xffFFFFFF)),
                                    ),
                                    // border: InputBorder.none,
                                    hintText: "Search Here....",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 15)),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 15, right: 10),
                                height: MediaQuery.of(context).size.height *
                                    (5 / 100),
                                // height: 100,
                                width: MediaQuery.of(context).size.width *
                                    (10 / 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Color(0xffFFFFFF),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        "${selectedDate}".split(' ')[0],
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 25,
                                        margin: EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Calendar.png',
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        _card(),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: _cardList.length,
                          itemBuilder: (context, index) {
                            return _cardList[index];
                          },
                        ),
                        Row(children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentDash()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 15, left: 15, right: 20, bottom: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: Color(0xff1F2326)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    margin: EdgeInsets.only(
                                        top: 15, right: 10, left: 30),
                                    height: 30,
                                    // width: 300,
                                    child: Image.asset(
                                        'assets/images/arrow-right.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _cardList.add(_card());
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 15, left: 15, right: 20, bottom: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: Color(0xff1A494F)),
                              height: MediaQuery.of(context).size.height *
                                  (7 / 100),
                              width: 160,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Add More Item",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             PaymentDash()));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      height: 20,
                                      width: 20,
                                      child: Image.asset(
                                          'assets/images/arrow-right.png'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ]),
                    ])),
              ])
            ])));
  }

  Widget _card() {
    return Card(
        child: Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      height: MediaQuery.of(context).size.height * (60 / 100),
      // height: 100,
      width: MediaQuery.of(context).size.width * (80 / 100),

      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Item 1",
                  style: TextStyle(fontSize: 18),
                )),
          ),
          Row(children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 15),
              height: 25,
              width: 25,
              child: ImageIcon(
                AssetImage(
                  'assets/images/car.png',
                ),
                size: 10,
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 5, top: 15),
                child: Text(
                  "Cars",
                  style: TextStyle(fontSize: 18),
                )),
            Spacer(),
            GestureDetector(
              onTap: () {
                _showDialogOnButtonPressing();
              },
              child: Container(
                margin: EdgeInsets.only(top: 15, left: 15, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xff1A494F)),
                height: MediaQuery.of(context).size.height * (7 / 100),
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Category",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Profile()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/images/arrow-right.png'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
          Container(
            margin: EdgeInsets.only(top: 10, right: 10, left: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Image",
                  style: TextStyle(fontSize: 18),
                )),
          ),
          // Container(
          // child: image.length == "0"
          //     ?
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                _openCamera(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                height: MediaQuery.of(context).size.height * (15 / 100),
                width: MediaQuery.of(context).size.width * (8 / 100),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xffE5E5E5),
                ),
                child: ImageIcon(
                  AssetImage(
                    'assets/images/document.png',
                  ),
                  size: 8,
                ),
              ),
            ),
          ),

          // ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: image.length,
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) {
          //       return Row(
          //         children: [
          //           Container(
          //             margin: EdgeInsets.only(left: 20, top: 20),
          //             height: MediaQuery.of(context).size.height * (20 / 100),
          //             width: MediaQuery.of(context).size.width * (10 / 100),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(15.0),
          //               color: Color(0xffE5E5E5),
          //             ),
          //             child: Image.file(
          //               image[index],
          //               fit: BoxFit.fill,
          //             ),
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               _openCamera(context);
          //             },
          //             child: Container(
          //               margin: EdgeInsets.only(left: 20, top: 20),
          //               height: MediaQuery.of(context).size.height * (20 / 100),
          //               width: MediaQuery.of(context).size.width * (10 / 100),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(15.0),
          //                 color: Color(0xffE5E5E5),
          //               ),
          //               child: ImageIcon(
          //                 AssetImage(
          //                   'assets/images/document.png',
          //                 ),
          //                 size: 8,
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     }),
          Container(
            margin: EdgeInsets.only(top: 20, right: 10, left: 20),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: TextFormField(
              initialValue:
                  "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.  Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.",
              // autofocus: false,
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
                  hintText:
                      "Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.  Nulla Lorem mollit cupidatat irure. Laborum magna nulla duis ullamco cillum dolor. Voluptate exercitation incididunt aliquip deserunt reprehenderit elit laborum.",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
            ),
          ),
        ],
      ),
    ));
  }
}
