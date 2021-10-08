// import 'package:flutter/material.dart';
// import 'package:responsive_scaffold_nullsafe/responsive_scaffold.dart';

// class MultiColumnNavigationExample extends StatelessWidget {
//   const MultiColumnNavigationExample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ThreeColumnNavigation(
//       title: const Text('Shipment'),
//       // showDetailsArrows: true,
//       backgroundColor: Colors.grey[100],
//       // bottomAppBar: BottomAppBar(
//       //   elevation: 1,
//       //   child: Row(
//       //     children: <Widget>[
//       //       IconButton(
//       //         icon: const Icon(
//       //           Icons.filter_list,
//       //           color: Colors.transparent,
//       //         ),
//       //         onPressed: () {},
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       sections: [
//         MainSection(
//           label: const Text('Dashb'),
//           icon: const Icon(Icons.mail),
//           itemCount: 100,
//           itemBuilder: (BuildContext context, int index, bool selected) {
//             return ListTile(
//               leading: CircleAvatar(
//                 child: Text(index.toString()),
//               ),
//               selected: selected,
//               title: const Text('Primary Information'),
//               subtitle: const Text('Here are some details about the item'),
//             );
//           },
//           bottomAppBar: BottomAppBar(
//             elevation: 1,
//             child: Row(
//               children: <Widget>[
//                 IconButton(
//                   icon: const Icon(Icons.filter_list),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           ),
//           getDetails: (context, index) {
//             return DetailsWidget(
//               title: const Text('Details'),
//               child: Center(
//                 child: Text(
//                   index.toString(),
//                 ),
//               ),
//             );
//           },
//         ),
//         MainSection(
//           label: const Text('Sent Mail'),
//           icon: const Icon(Icons.send),
//           itemCount: 100,
//           itemBuilder: (context, index, selected) {
//             return ListTile(
//               leading: CircleAvatar(
//                 child: Text(index.toString()),
//               ),
//               selected: selected,
//               title: const Text('Secondary Information'),
//               subtitle: const Text('Here are some details about the item'),
//             );
//           },
//           getDetails: (context, index) {
//             return DetailsWidget(
//               title: const Text('Details'),
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.share),
//                   onPressed: () {},
//                 ),
//               ],
//               child: Center(
//                 child: Text(
//                   index.toString(),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
/*
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey _widgetKey = GlobalKey();
  final GlobalKey _widgetKey1 = GlobalKey();
  bool showCreateChannelcustompoup = false;
  bool isShowChatCategory = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth * 0.8);
    print(screenWidth * 0.2);
    return Scaffold(
        body: !Responsive.isMobile(context)
            ? Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all(color: Colors.blue, width: 3),
                      color: sidemenuColor,
                    ),
                    // height: screenHeight,
                    width: Responsive.isMobile(context)
                        ? screenWidth * 0.2
                        : screenWidth * 0.058,
                    // width: screenWidth / 16,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.only(
                                  bottom: 8, right: 10, top: 10),
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/Union.png'),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.blue, width: 3),
                        color: Color(0xff212328),
                      ),
                      // height: screenHeight,
                      width: Responsive.isMobile(context)
                          ? screenWidth * 0.8
                          : screenWidth * 0.942,
                      // width: screenWidth / 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: screenHeight * 0.14,
                            width: screenWidth,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed('/dashboard');
                                          // Navigator.pushReplacement(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //             WebDashboardScreen()));
                                        },
                                        child: Image.asset(
                                            'assets/arrow_png.png')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "BACK",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Settings',
                                      style: TextStyle(
                                          color: Color(0xffEEF2FF),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // height: screenHeight * 0.72,
                                  // width: screenWidth * 0.942 * 0.4 - 30,
                                  width: Responsive.isMobile(context)
                                      ? screenWidth - 30
                                      : screenWidth > 1090
                                          ? screenWidth * 0.942 * 0.4 - 30
                                          : screenWidth * 0.942 * 0.5 - 30,
                                  padding: EdgeInsets.all(25),
                                  // width: 400,
                                  color: Color(0xff121212),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "CHAT CATEGORIES",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            // PopupWindowButton(
                                            //     offset:
                                            //         Offset(screenWidth / 2 - 60, 50),
                                            //     buttonBuilder: (BuildContext context) {
                                            //       return Container(
                                            //         height: 36,
                                            //         decoration: BoxDecoration(
                                            //             gradient: gradientcolor25),
                                            //         child: OutlineGradientButton(
                                            //           gradient: gradientbordercolor,
                                            //           strokeWidth: 2,
                                            //           child: Center(
                                            //               child: Text(
                                            //             "CREATE CHAT CATEGORY",
                                            //             style: TextStyle(
                                            //                 color: Colors.white,
                                            //                 fontSize: 12,
                                            //                 fontWeight:
                                            //                     FontWeight.w700),
                                            //           )),
                                            //         ),
                                            //       );
                                            //     },
                                            //     windowBuilder: (BuildContext context,
                                            //         Animation<double> animation,
                                            //         Animation<double>
                                            //             secondaryAnimation) {
                                            //       print('object1233');
                                            //       return FadeTransition(
                                            //           opacity: animation,
                                            //           child: SizeTransition(
                                            //               sizeFactor: animation,
                                            //               child: Material(
                                            //                   color: Color(0xff21232a),
                                            //                   child: Container(
                                            //                     color:
                                            //                         Color(0xff21232a),
                                            //                     height: 150,
                                            //                     width: 300,
                                            //                     child: Column(
                                            //                       crossAxisAlignment:
                                            //                           CrossAxisAlignment
                                            //                               .start,
                                            //                       children: [
                                            //                         Row(
                                            //                           mainAxisAlignment:
                                            //                               MainAxisAlignment
                                            //                                   .spaceBetween,
                                            //                           children: [
                                            //                             Text(""),
                                            //                             Text(""),
                                            //                             Text(""),
                                            //                             Container(
                                            //                               margin: EdgeInsets
                                            //                                   .only(
                                            //                                       top:
                                            //                                           10,
                                            //                                       bottom:
                                            //                                           10),
                                            //                               alignment:
                                            //                                   Alignment
                                            //                                       .topLeft,
                                            //                               // width: 300,
                                            //                               child: Text(
                                            //                                 "CREATE CHAT CATEGORY",
                                            //                                 maxLines: 2,
                                            //                                 textAlign:
                                            //                                     TextAlign
                                            //                                         .center,
                                            //                                 style: TextStyle(
                                            //                                     fontSize:
                                            //                                         12,
                                            //                                     fontWeight:
                                            //                                         FontWeight
                                            //                                             .w700,
                                            //                                     color: Color(
                                            //                                         0xffDADEF9)),
                                            //                               ),
                                            //                             ),
                                            //                             InkWell(
                                            //                                 onTap: () {
                                            //                                   Navigator.pop(
                                            //                                       context);
                                            //                                 },
                                            //                                 child: Icon(
                                            //                                     Icons
                                            //                                         .cancel,
                                            //                                     color: Colors
                                            //                                         .white)),
                                            //                           ],
                                            //                         ),
                                            //                         Divider(
                                            //                           color:
                                            //                               Colors.black,
                                            //                         ),
                                            //                         Row(
                                            //                           mainAxisAlignment:
                                            //                               MainAxisAlignment
                                            //                                   .start,
                                            //                           children: [
                                            //                             Container(
                                            //                               padding: EdgeInsets
                                            //                                   .only(
                                            //                                       top:
                                            //                                           2,
                                            //                                       bottom:
                                            //                                           2),
                                            //                               // height: 40,
                                            //                               width: 180,
                                            //                               child:
                                            //                                   TextFormField(
                                            //                                 // controller: emailController,
                                            //                                 style: TextStyle(
                                            //                                     color:
                                            //                                         textfiledtextcolor,
                                            //                                     fontWeight:
                                            //                                         FontWeight
                                            //                                             .w400,
                                            //                                     fontSize:
                                            //                                         14),
                                            //                                 keyboardType:
                                            //                                     TextInputType
                                            //                                         .emailAddress,
                                            //                                 autofocus:
                                            //                                     false,
                                            //                                 decoration:
                                            //                                     InputDecoration(
                                            //                                   fillColor:
                                            //                                       textfieldbgColor,

                                            //                                   border:
                                            //                                       UnderlineInputBorder(
                                            //                                     borderSide:
                                            //                                         BorderSide.none,
                                            //                                   ),
                                            //                                   filled:
                                            //                                       true,
                                            //                                   hintText:
                                            //                                       ('Add Chat Category Name'),
                                            //                                   // Chat Category Name
                                            //                                   hintStyle: TextStyle(
                                            //                                       color:
                                            //                                           textfiledtextcolor,
                                            //                                       fontWeight: FontWeight
                                            //                                           .w400,
                                            //                                       fontSize:
                                            //                                           12),

                                            //                                   enabledBorder:
                                            //                                       const OutlineInputBorder(
                                            //                                     borderSide:
                                            //                                         BorderSide(width: 1),
                                            //                                   ),
                                            //                                 ),
                                            //                               ),
                                            //                             ),
                                            //                             SizedBox(
                                            //                               width: 10,
                                            //                             ),
                                            //                             Container(
                                            //                               width: 50,
                                            //                               child:
                                            //                                   InkWell(
                                            //                                 onTap: () {
                                            //                                   // Navigator.pushReplacement(
                                            //                                   //     context,
                                            //                                   //     MaterialPageRoute(
                                            //                                   //         builder: (context) => ChatCategoryScreen()));
                                            //                                 },
                                            //                                 child:
                                            //                                     Container(
                                            //                                   height:
                                            //                                       25,
                                            //                                   decoration:
                                            //                                       BoxDecoration(
                                            //                                     gradient:
                                            //                                         gradientcolor25,
                                            //                                   ),
                                            //                                   child:
                                            //                                       OutlineGradientButton(
                                            //                                     gradient:
                                            //                                         gradientbordercolor,
                                            //                                     strokeWidth:
                                            //                                         2,
                                            //                                     child: Center(
                                            //                                         child: Text(
                                            //                                       "ADD",
                                            //                                       style: TextStyle(
                                            //                                           color: Colors.white,
                                            //                                           fontSize: 10,
                                            //                                           fontWeight: FontWeight.w700),
                                            //                                     )),
                                            //                                   ),
                                            //                                 ),
                                            //                               ),
                                            //                             ),
                                            //                           ],
                                            //                         ),
                                            //                       ],
                                            //                     ),
                                            //                   ))));
                                            //     }
                                            Container(
                                              key: _widgetKey,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isShowChatCategory =
                                                        !isShowChatCategory;
                                                  });
                                                },
                                                // onTapUp:
                                                //     (TapUpDetails details) {
                                                //   showCreateChatCategoryPopup();
                                                // },
                                                child: Container(
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          gradientcolor25),
                                                  child: OutlineGradientButton(
                                                    gradient:
                                                        gradientbordercolor,
                                                    strokeWidth: 2,
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: Center(
                                                          child: Text(
                                                        "CREATE CHAT CATEGORY",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Text("LIST OF CHAT CATEGORIES",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              !Responsive.isMobile(context)
                                                  ? ChatCategoryListComp()
                                                  : ChatCategoryScreen()
                                            ],
                                          ),
                                          if (isShowChatCategory)
                                            Positioned(
                                                top: 0,
                                                right: getPos(),
                                                child:
                                                    createChatCategoryCustomPopup())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                // if (!Responsive.isMobile(context))
                                Container(
                                  // height: screenHeight * 0.72,
                                  width: screenWidth > 1090
                                      ? screenWidth * 0.942 * 0.6 - 30
                                      : screenWidth * 0.942 * 0.5 - 30,
                                  // width: 400,
                                  color: Color(0xff121212),
                                  padding: EdgeInsets.all(25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "CHAT CHANNEL",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Container(
                                              key: _widgetKey1,
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: GestureDetector(
                                                // onTap: () {
                                                //   setState(() {
                                                //     showCreateChannelcustompoup =
                                                //         !showCreateChannelcustompoup;
                                                //   });
                                                // },

                                                onTapUp:
                                                    (TapUpDetails details) {
                                                  // showCreateChatChannelPopup();
                                                  // Navigator.pushReplacement(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) => ChatCategoryScreen()));
                                                },
                                                child: Container(
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                          gradientcolor25),
                                                  child: OutlineGradientButton(
                                                    gradient:
                                                        gradientbordercolor,
                                                    strokeWidth: 2,
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: Center(
                                                          child: Text(
                                                        "CREATE CHAT CHANNEL",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Stack(
                                        children: [
                                          Column(
                                            children: [
                                              Text("LIST OF CHAT CHANNELS",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              ChatChannelListComp()
                                            ],
                                          ),
                                          if (showCreateChannelcustompoup)
                                            Positioned(
                                                top: 0,
                                                right: 0,
                                                child:
                                                    createChatChannelCustompopup())
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              )
            : ChatCategoryScreen());
  }

  //---------------------------------Popups--------------------------------------
}
*/