import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shipment/Element/validation.dart';
import 'package:shipment/pages/Shipment/LoginSignUp/LoginScreenShipment.dart';
import 'package:shipment/pages/Shipment/LoginSignUp/SignupShipment.dart';

class SignupScreenfirst extends StatefulWidget {
  const SignupScreenfirst({Key? key}) : super(key: key);
  static const route = '/SignupScreenfirst';
  @override
  _SignupScreenfirstState createState() => _SignupScreenfirstState();
}

class _SignupScreenfirstState extends State<SignupScreenfirst> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool monVal = false;
  String? name, emailAddress, phoneNumber, password;

  String? radioItem = '';
  bool _obscureText = true;

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
                          child: Text("Register Individual Account!",
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700))),

                      Divider(
                        height: 50,
                        color: Colors.white,
                        // thickness: 3,
                      ),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin:
                                EdgeInsets.only(top: 36, left: 15, right: 15),
                            child: Text("Name",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          validator: (val) => _requiredField(val, "Name"),
                          onChanged: (value) {
                            name = value;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                              hintText: "Enter user name",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                      // SizedBox(height: MediaQuery.of(context).size.height * (5 / 100)),

                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text("Email address*",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),

                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          validator: (val) => _emailValidation(val, "Email"),
                          onChanged: (value) {
                            emailAddress = value;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                              hintText: "Enter Email address*",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text("Phone number",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),

                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          initialValue: "",
                          validator: (val) =>
                              _requiredField(val, "Contact Number"),
                          onChanged: (value) {
                            phoneNumber = value;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                              hintText: "Enter contact Number",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: Text("Password*",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400))),
                      ),
                      Container(
                        margin: EdgeInsets.all(14),
                        child: TextFormField(
                          validator: (val) => _requiredField(val, "Password"),
                          onChanged: (value) {
                            password = value;
                          },
                          style: TextStyle(color: Colors.white, fontSize: 17),
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
                              hintText: "Password",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 15)),
                        ),
                      ),

                      // Container(
                      //   margin: EdgeInsets.all(14),
                      //   child: TextFormField(
                      //     initialValue: "",
                      //     onChanged: (value) {
                      //       password = value;
                      //     },
                      //     style: TextStyle(color: Colors.white, fontSize: 17),
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
                      //         focusedBorder: new OutlineInputBorder(
                      //           borderRadius: new BorderRadius.circular(50.0),
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
                      //           borderSide:
                      //               BorderSide(width: 1.2, color: Colors.white),
                      //         ),
                      //         // border: InputBorder.none,
                      //         hintText: "Password",
                      //         hintStyle:
                      //             TextStyle(color: Colors.grey, fontSize: 15)),
                      //   ),
                      // ),

                      RadioListTile(
                        groupValue: radioItem,
                        title: Text('Keep me Logged in',
                            style: TextStyle(color: Colors.white)),
                        value: 'Item 1',
                        onChanged: (val) {
                          setState(() {
                            // radioItem = val;
                          });
                        },
                      ),

                      GestureDetector(
                        onTap: () {
                          var data = {
                            "name": "$name",
                            "email": "$emailAddress",
                            "phone": "$phoneNumber",
                            "password": "$password"
                          };

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupShipment(data)));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 40, left: 15, right: 15),
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
                                      child: Text("Next",
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
                              'Do you already have an account?',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginScreenShipment()));
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
