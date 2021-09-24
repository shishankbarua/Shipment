import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  var h, w;
  var exp = false, openSUBMENU = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: exp ? w * 0.8 : w * 0.8,
        color: Color(0xffE5E5E5),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
                  child: Text(
                    'Transactions',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                  height: 52,
                  width: MediaQuery.of(context).size.width * (10 / 100),
                  child: TextFormField(
                    initialValue: '',
                    onChanged: (value) {},
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        // border: InputBorder.none,
                        hintText: "Search Here....",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(15, 15, 10, 0),
                  height: 52,
                  width: MediaQuery.of(context).size.width * (10 / 100),
                  child: TextFormField(
                    initialValue: '',
                    onChanged: (value) {},
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    decoration: InputDecoration(
                        fillColor: Color(0xffFFFFFF),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          // borderRadius: new BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(width: 1.2, color: Color(0xffFFFFFF)),
                        ),
                        // border: InputBorder.none,
                        hintText: "Search Here....",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
