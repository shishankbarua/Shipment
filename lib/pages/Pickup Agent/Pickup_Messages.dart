import 'package:flutter/material.dart';
import 'package:shipment/Element/ViewChatScreen.dart';
import 'package:shipment/Model/Chat.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Pickup%20Agent/Pickup_Sidebar.dart';
import 'package:shipment/component/Res_Client/ChatCard.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class Pickup_Messages extends StatefulWidget {
  const Pickup_Messages({Key? key}) : super(key: key);

  @override
  _Pickup_MessagesState createState() => _Pickup_MessagesState();
}

class _Pickup_MessagesState extends State<Pickup_Messages> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? selectedDate = DateTime.now();
  var h, w;
  var exp = true, openSUBMENU = false;
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: PickupSideBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: Color(0xffE5E5E5),
        child: SafeArea(
          right: false,
          child: Column(
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
                    if (!Responsive.isDesktop(context)) SizedBox(width: 5),
                    // Expanded(
                    //   child: TextField(
                    //     onChanged: (value) {},
                    //     decoration: InputDecoration(
                    //       hintText: "Search",
                    //       fillColor: kBgLightColor,
                    //       filled: true,
                    //       suffixIcon: Padding(
                    //         padding: const EdgeInsets.all(
                    //             kDefaultPadding * 0.75), //15
                    //         child: WebsafeSvg.asset(
                    //           "assets/Icons/Search.svg",
                    //           width: 24,
                    //         ),
                    //       ),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              // SizedBox(height: kDefaultPadding),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //   child: Row(
              //     children: [
              //       WebsafeSvg.asset(
              //         "assets/Icons/Angle down.svg",
              //         width: 16,
              //         color: Colors.black,
              //       ),
              //       SizedBox(width: 5),
              //       Text(
              //         "Sort by date",
              //         style: TextStyle(fontWeight: FontWeight.w500),
              //       ),
              //       Spacer(),
              //       MaterialButton(
              //         minWidth: 20,
              //         onPressed: () {},
              //         child: WebsafeSvg.asset(
              //           "assets/Icons/Sort.svg",
              //           width: 16,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 15, 0, 0),
                    height: 52,
                    width: MediaQuery.of(context).size.width * (27 / 100),
                    child: TextFormField(
                      initialValue: '',
                      onChanged: (value) {},
                      style: TextStyle(color: Colors.black54, fontSize: 17),
                      decoration: InputDecoration(
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // tapped == true ? progessBar() : null;
                            },
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search, color: Colors.grey),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffFFFFFF)),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffFFFFFF)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffFFFFFF)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1.2, color: Color(0xffFFFFFF)),
                          ),
                          // border: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder: (context, index) => ChatCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    chat: messages[index],
                    press: () {
                      (!Responsive.isDesktop(context))
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatViewScreen(),
                              ))
                          : Null;
                    },
                  ),
                ),
              ),

              // ListView.builder(
              //       physics: NeverScrollableScrollPhysics(),
              //       scrollDirection: Axis.vertical,
              //       itemCount: 5,
              //       shrinkWrap: true,
              //       itemBuilder: (context, index) {
              //         return InkWell(
              //           onTap: () {},
              //           child: Container(
              //               margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                   color: Color(0xffFFFFFF)),
              //               // height: MediaQuery.of(context).size.height * 0.12,
              //               height: 97,
              //               width: 373,
              //               // width: MediaQuery.of(context).size.width * 0.9,
              //               // color: Colors.lime,
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.center,
              //                   children: [
              //                     Container(
              //                       margin: EdgeInsets.only(left: 10, right: 10),
              //                       child: Image.asset(
              //                           'assets/images/Ellipse7.png',
              //                           fit: BoxFit.fill),
              //                     ),
              //                     Expanded(
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(0.0),
              //                         child: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.spaceBetween,
              //                               children: [
              //                                 Container(
              //                                   margin: EdgeInsets.only(top: 15),
              //                                   child: Text("Shishank",
              //                                       style: TextStyle(
              //                                         color: Colors.black,
              //                                         fontWeight: FontWeight.bold,
              //                                         fontSize: 14,
              //                                       )),
              //                                 ),
              //                                 Container(
              //                                   margin: EdgeInsets.only(top: 15),
              //                                   child: Text("Today : 08:56 PM",
              //                                       style: TextStyle(
              //                                         color: Color(0xffc4c4c4),
              //                                         fontWeight: FontWeight.bold,
              //                                         fontSize: 10,
              //                                       )),
              //                                 ),
              //                               ],
              //                             ),
              //                             Container(
              //                               margin: EdgeInsets.only(
              //                                   top: 10, right: 10),
              //                               child: Text("Dinner??",
              //                                   overflow: TextOverflow.ellipsis,
              //                                   maxLines: 1,
              //                                   softWrap: false,
              //                                   style: TextStyle(
              //                                     color: Colors.grey,
              //                                     fontWeight: FontWeight.bold,
              //                                     fontSize: 10,
              //                                   )),
              //                             ),
              //                             // Align(
              //                             //   alignment:
              //                             //       Alignment.bottomRight,
              //                             //   child: Container(
              //                             //       height: 15,
              //                             //       width: 20,
              //                             //       decoration:
              //                             //           BoxDecoration(
              //                             //               // borderRadius: BorderRadius.circular(50),
              //                             //               shape: BoxShape
              //                             //                   .circle,
              //                             //               color: Color(
              //                             //                   0xffFF2828)),
              //                             //       // margin: EdgeInsets.only(right: 10),
              //                             //       child: Center(
              //                             //         child: Text(
              //                             //           "1",
              //                             //           style: TextStyle(
              //                             //               fontSize: 8),
              //                             //         ),
              //                             //       )),
              //                             // ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               )),
              //         );
              //       }),
            ],
          ),
        ),
      ),
    );
  }
}
