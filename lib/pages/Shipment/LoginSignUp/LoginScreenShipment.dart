// ignore_for_file: file_names, prefer_const_constructors

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:sha3/sha3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shipment/Element/validation.dart';
import 'package:shipment/Provider/Provider.dart';
import 'package:shipment/component/Res_Shipment.dart/Dashboard/Res_dashboard_shipment.dart';
import 'package:shipment/pages/Shipment/LoginSignUp/SignupShipmentfirst.dart';
import 'package:http/http.dart' as http;

class LoginScreenShipment extends StatefulWidget {
  const LoginScreenShipment({Key? key}) : super(key: key);

  @override
  _LoginScreenShipmentState createState() => _LoginScreenShipmentState();
}

class _LoginScreenShipmentState extends State<LoginScreenShipment> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();

  bool? monVal = false;
  bool? monVal2 = false;
  bool _obscureText = true;

  String? email, password;

  _emailValidation(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }

    final validemail = validEmailField(val, field);
    if (validemail != null) return validemail;
  }

  _requiredField(val, field) {
    final required = requiredField(val, field);
    if (required != null) {
      return required;
    }
  }

  String encodeToSHA3(password) {
    var k = SHA3(512, SHA3_PADDING, 512);
    k.update(utf8.encode(password));
    var hash = k.digest();
    return HEX.encode(hash);
  }

  var shipmentToken;
  doShipmentLOgin() async {
    if (this._formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      var loginData = {
        "email": "$email",
        "password": "${encodeToSHA3(password)}",
      };
      print(jsonEncode(loginData));

      var loginshipment = await Providers().loginShipment(loginData);
      if (loginshipment.status == true) {
        shipmentToken = loginshipment.data[0].token;
        print("Client Token $shipmentToken");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('Shipemnt_auth_token', shipmentToken);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResDashboardshipment()));
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(loginshipment.message),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future(() => true);
      },
      child: MaterialApp(
          home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Background.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
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
                              child: Text("Sign in",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.white,
                                      fontSize: 36,
                                      fontWeight: FontWeight.w700))),
                          Container(
                              margin:
                                  EdgeInsets.only(top: 12, left: 15, right: 15),
                              child: Text("Go inside the best Shipment!",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 15, left: 15),
                                  child: Image.asset(
                                      'assets/images/Group 13.png',
                                      height: 52,
                                      width: 50)),
                              Container(
                                  margin: EdgeInsets.only(top: 15, left: 16),
                                  child: Image.asset(
                                      'assets/images/Group 14.png',
                                      height: 52,
                                      width: 52)),
                              Container(
                                  margin: EdgeInsets.only(top: 15, left: 16),
                                  child: Image.asset(
                                      'assets/images/Group 15.png',
                                      height: 52,
                                      width: 52)),
                            ],
                          ),

                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
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
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.white,
                                    height: 36,
                                  )),
                            ),
                          ]),
                          // Container(
                          //     margin:
                          //         EdgeInsets.only(top: 40, left: 15, right: 15),
                          //     child: Text("or",
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w400))),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.only(
                                    top: 36, left: 15, right: 15),
                                child: Text("Your email",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))),
                          ),
                          Container(
                            margin: EdgeInsets.all(14),
                            child: TextFormField(
                              // initialValue: "",
                              // controller: emailController,
                              validator: (val) =>
                                  _emailValidation(val, "Email"),

                              onChanged: (value) {
                                email = value;
                              },
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
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
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
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
                                    borderSide: BorderSide(
                                        width: 1.2, color: Colors.white),
                                  ),
                                  // border: InputBorder.none,
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                          // SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 15, right: 15),
                                child: Text("Choose a password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400))),
                          ),

                          Container(
                            margin: EdgeInsets.all(14),
                            child: TextFormField(
                              validator: (val) =>
                                  _requiredField(val, "Password"),
                              onChanged: (value) {
                                password = value;
                              },
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _obscureText = !_obscureText;
                                      });
                                    },
                                    child: Icon(
                                        _obscureText
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: BorderSide(
                                      width: 1.2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(50.0),
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
                                    borderSide: BorderSide(
                                        width: 1.2, color: Colors.white),
                                  ),
                                  // border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),

                          // Container(
                          //   margin: EdgeInsets.all(14),
                          //   child: TextFormField(
                          //     // initialValue: "",
                          //     // controller: passwordController,
                          //     onChanged: (value) {
                          //       password = value;
                          //     },
                          //     style:
                          //         TextStyle(color: Colors.white, fontSize: 17),
                          //     decoration: InputDecoration(
                          //         fillColor: Colors.transparent,
                          //         filled: true,
                          //         enabledBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(50.0),
                          //           borderSide: BorderSide(
                          //             width: 1.2,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //         focusedBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(50.0),
                          //           borderSide: BorderSide(
                          //             width: 1.2,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //         errorBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(50.0),
                          //           borderSide: BorderSide(
                          //             width: 1.2,
                          //             color: Colors.white,
                          //           ),
                          //         ),
                          //         focusedErrorBorder: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(50.0),
                          //           borderSide: BorderSide(
                          //               width: 1.2, color: Colors.white),
                          //         ),
                          //         // border: InputBorder.none,
                          //         hintText: "Enter password",
                          //         hintStyle: TextStyle(
                          //             color: Colors.grey, fontSize: 15)),
                          //   ),
                          // ),

                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Divider(
                                    color: Color(0xffFFC107),
                                    // height: 70,
                                    thickness: 5,
                                  )),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: Divider(
                                    color: Colors.white,
                                    // height: 70,
                                    thickness: 5,
                                  )),
                            ),
                          ]),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                margin: EdgeInsets.only(left: 10, right: 15),
                                child: Text(
                                    "Not bad but you know you can do it better",
                                    style: TextStyle(
                                        color: Color(0xffFFC107),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400))),
                          ),

                          Container(
                            margin:
                                EdgeInsets.only(left: 5, right: 15, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    activeColor: Color(0xff43A047),
                                    value: monVal,
                                    onChanged: (bool? value) async {
                                      setState(() {
                                        monVal = value;
                                      });
                                    },
                                  ),
                                ),
                                Text("I agree to terms & conditions",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      unselectedWidgetColor: Colors.white),
                                  child: Checkbox(
                                    activeColor: Color(0xff43A047),
                                    value: monVal2,
                                    onChanged: (bool? value) async {
                                      setState(() {
                                        monVal2 = value;
                                      });
                                    },
                                  ),
                                ),
                                Text(
                                    "I???d like being informed about latest news and tips",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              doShipmentLOgin();
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ResDashboardshipment()));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 40),
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
                                          child: Text("Sign in as Shipment",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              )))),
                                  Container(
                                    margin: EdgeInsets.only(top: 15, right: 10),
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                        'assets/images/arrow-right.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 20, 5, 10),
                                child: Text(
                                  'Don???t have an account?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignupScreenfirst()),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  child: Text(
                                    'Sign up',
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
        ),
      )),
    );
  }
}
