import 'package:flutter/material.dart';

class SignupShipment extends StatefulWidget {
  @override
  _SignupShipmentState createState() => _SignupShipmentState();
}

class _SignupShipmentState extends State<SignupShipment> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool monVal = false;

  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: _formKey,
          child: Center(
            child: SizedBox(
              width: 400,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 64, left: 15),
                          child: Text("Sign up for Shipment",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700))),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin:
                                EdgeInsets.only(top: 36, left: 15, right: 15),
                            child: Text("Company Name*",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide:
                                    BorderSide(width: 1.2, color: Colors.white),
                              ),
                              // border: InputBorder.none,
                              hintText: "Enter company name",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                      // SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text("Shipping destination ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),

                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Colors.transparent),
                              ),
                              // border: InputBorder.none,
                              hintText: "USA",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text("Current Country",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),

                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                          decoration: InputDecoration(
                              fillColor: Colors.transparent,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.transparent,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                  width: 1.2,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(
                                    width: 1.2, color: Colors.transparent),
                              ),
                              // border: InputBorder.none,
                              hintText: "Current Country",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 40),
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
                                    child: Text("Submit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )))),
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset('assets/images/arrow-right.png'),
                            ),
                          ],
                        ),
                      ),

                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: Divider(
                                color: Colors.white,
                                height: 36,
                              )),
                        ),
                        Text("or",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400)),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: Divider(
                                color: Colors.white,
                                height: 36,
                              )),
                        ),
                      ]),

                      Container(
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xff1F2326)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/images/google.png'),
                            ),
                            Container(
                                margin: EdgeInsets.all(15),

                                // width: MediaQuery.of(context).size.width * 0.8,
                                // color: Colors.lime,
                                child: Center(
                                    child: Text("Register with Google",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )))),
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset('assets/images/arrow-right.png'),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xff1F2326)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/images/face.png'),
                            ),
                            Container(
                                margin: EdgeInsets.all(15),

                                // width: MediaQuery.of(context).size.width * 0.8,
                                // color: Colors.lime,
                                child: Center(
                                    child: Text("Register with Facebook",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )))),
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset('assets/images/arrow-right.png'),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: Color(0xff1F2326)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child: Image.asset('assets/images/Linkedin.png'),
                            ),
                            Container(
                                margin: EdgeInsets.all(15),

                                // width: MediaQuery.of(context).size.width * 0.8,
                                // color: Colors.lime,
                                child: Center(
                                    child: Text("Register with LinkedIn",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        )))),
                            Container(
                              margin: EdgeInsets.only(top: 15, right: 10),
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset('assets/images/arrow-right.png'),
                            ),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 20, 5, 10),
                            child: Text(
                              'Do you already have an account?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LoginScreen()),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 20, bottom: 10),
                              child: Text(
                                'Log in',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
