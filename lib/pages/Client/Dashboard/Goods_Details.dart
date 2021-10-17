import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Responsive.dart';
import 'package:shipment/component/Payment_Summary.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class GoodsDetails extends StatefulWidget {
  const GoodsDetails({Key? key}) : super(key: key);

  @override
  _GoodsDetailsState createState() => _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;

  var exp = true, openSUBMENU = false;
  var exp2 = -1;
  int _selectedIndex = 0;
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

  List image = [];
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
                        // if (Responsive.isDesktop(context)) SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
                          child: Text(
                            'Dashboard > Cosco >Pickup / Drop Off > Goods info',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _card(),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _cardList.length,
                    itemBuilder: (context, index) {
                      return _cardList[index];
                    },
                  ),
                  if (Responsive.isDesktop(context))
                    Row(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentSummary()));
                        },
                        child: Container(
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
                          height:
                              MediaQuery.of(context).size.height * (7 / 100),
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
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                    'assets/images/arrow-right.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
                  if (Responsive.isMobile(context))
                    Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _cardList.add(_card());
                          });
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xff1A494F)),
                            height:
                                MediaQuery.of(context).size.height * (7 / 100),
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
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                      'assets/images/arrow-right.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentSummary()));
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 15, left: 15, right: 20, bottom: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xff1F2326)),
                            width: MediaQuery.of(context).size.width * (0.75),
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
                      ),
                    ]),
                  if (Responsive.isTablet(context))
                    Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _cardList.add(_card());
                          });
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                              top: 15,
                              left: 15,
                              right: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Color(0xff1A494F)),
                            height:
                                MediaQuery.of(context).size.height * (7 / 100),
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
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 20,
                                  width: 20,
                                  child: Image.asset(
                                      'assets/images/arrow-right.png'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentSummary()));
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 15, left: 15, right: 20, bottom: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Color(0xff1F2326)),
                            width: MediaQuery.of(context).size.width * (0.75),
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
                      ),
                    ]),
                ],
              ))),
    );
  }

  Widget _card() {
    return Card(
        child: Container(
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      height: MediaQuery.of(context).size.height * (60 / 100),
      // height: 100,
      width: MediaQuery.of(context).size.width * (70 / 100),

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
