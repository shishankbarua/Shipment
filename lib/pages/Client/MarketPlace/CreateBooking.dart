// import 'dart:developer';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:shipment/Element/TextStyle.dart';
// import 'package:shipment/pages/Client/Dashboard/Dashboard.dart';
// import 'package:shipment/pages/Client/MarketPlace/MarketPlace.dart';
// import 'package:shipment/pages/Client/Transactions/Transactions.dart';
// import 'package:timelines/timelines.dart';

// const kTileHeight = 50.0;

// const completeColor = Color(0xff5e6172);
// const inProgressColor = Color(0xff5ec792);
// const todoColor = Color(0xffd1d2d7);

// class CreateBooking extends StatefulWidget {
//   const CreateBooking({Key? key}) : super(key: key);

//   @override
//   _CreateBookingState createState() => _CreateBookingState();
// }

// class _CreateBookingState extends State<CreateBooking> {
//   bool _value = false;
//   int? val = -1;
//   var h, w;
//   var exp = true, openSUBMENU = false;

//   int _processIndex = 2;

//   Color getColor(int index) {
//     if (index == _processIndex) {
//       return inProgressColor;
//     } else if (index < _processIndex) {
//       return completeColor;
//     } else {
//       return todoColor;
//     }
//   }

//   Widget sideBar() {
//     return Container(
//       height: h,
//       width: exp ? w * 0.2 : w * 0.1,
//       color: Color(0xffFFFFFF),
//       child: exp
//           ? Column(
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(top: 20),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Color(0xffFFFFFF)),
//                     // height: MediaQuery.of(context).size.height * 0.12,
//                     height: 97,
//                     width: 373,
//                     // width: MediaQuery.of(context).size.width * 0.9,
//                     // color: Colors.lime,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                               margin: EdgeInsets.only(left: 10, right: 10),
//                               child: Image.asset('assets/images/Ellipse7.png'),
//                               height: 48,
//                               width: 48),
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.all(0.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(top: 15),
//                                     child: Text("Shishank",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14,
//                                         )),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(right: 10),
//                                     child: Text("Shishank.barua@gmail.com",
//                                         style: TextStyle(
//                                           color: Colors.grey,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 10,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => Dashboard()));
//                     // setState(() {
//                     //   openSUBMENU = !openSUBMENU;
//                     // });
//                   },
//                   child: Container(
//                     margin: EdgeInsets.only(top: 15),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Color(0xffFFFFFF)),
//                     height: MediaQuery.of(context).size.height * (8 / 100),
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Color(0xffEEEEEE)),
//                             height: 15,
//                             width: 15,
//                             child: ImageIcon(
//                               AssetImage(
//                                 'assets/images/dashboard.png',
//                               ),
//                               size: 10,
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Text(
//                             'Dashboard',
//                             style: TextStyle(
//                                 color: Color(0xff1A494F),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (context) => Profile()));
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             height: 15,
//                             width: 15,
//                             child: Image.asset(
//                               'assets/images/arrow-right.png',
//                               color: Color(0xff1A494F),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 // openSUBMENU
//                 //     ? Container(
//                 //         height: 250,
//                 //         width: w * 0.2,
//                 //         color: Color(0xffE5E5E5),
//                 //       )
//                 //     : Container(),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => MarketPlace()));
//                     // setState(() {
//                     //   openSUBMENU = !openSUBMENU;
//                     // });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Color(0xffFFFFFF)),
//                     height: MediaQuery.of(context).size.height * (8 / 100),
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Color(0xffEEEEEE)),
//                             height: 15,
//                             width: 15,
//                             child: ImageIcon(
//                               AssetImage(
//                                 'assets/images/shipmentlistingicon.png',
//                               ),
//                               size: 10,
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Text(
//                             'Market Place',
//                             style: TextStyle(
//                                 color: Color(0xff1A494F),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (context) => Profile()));
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             height: 15,
//                             width: 15,
//                             child: Image.asset(
//                               'assets/images/arrow-right.png',
//                               color: Color(0xff1A494F),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),

//                 InkWell(
//                   onTap: () {
//                     // setState(() {
//                     //   openSUBMENU = !openSUBMENU;
//                     // });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Color(0xffFFFFFF)),
//                     height: MediaQuery.of(context).size.height * (8 / 100),
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Color(0xffEEEEEE)),
//                             height: 15,
//                             width: 15,
//                             child: ImageIcon(
//                               AssetImage(
//                                 'assets/images/shipmentlistingicon.png',
//                               ),
//                               size: 10,
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Text(
//                             'Booking',
//                             style: TextStyle(
//                                 color: Color(0xff1A494F),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             // Navigator.push(context,
//                             //     MaterialPageRoute(builder: (context) => Profile()));
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             height: 15,
//                             width: 15,
//                             child: Image.asset(
//                               'assets/images/arrow-right.png',
//                               color: Color(0xff1A494F),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),

//                 // openSUBMENU
//                 //     ? Container(
//                 //         height: 150,
//                 //         width: w * 0.2,
//                 //         color: Color(0xffE5E5E5),

//                 //         child: Column(
//                 //           children: [

//                 //           ],
//                 //         ),
//                 //       )
//                 //     : Container(),
//                 InkWell(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Transactions()));
//                   },
//                   child: Container(
//                     // margin: EdgeInsets.only(top: 15),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15.0),
//                         color: Color(0xffFFFFFF)),
//                     height: MediaQuery.of(context).size.height * (8 / 100),
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                             margin: EdgeInsets.only(left: 10),
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: Color(0xffEEEEEE)),
//                             height: 15,
//                             width: 15,
//                             child: ImageIcon(
//                               AssetImage(
//                                 'assets/images/transicon.png',
//                               ),
//                               size: 10,
//                             )),
//                         Container(
//                           margin: EdgeInsets.only(left: 20),
//                           child: Text(
//                             'Transactions',
//                             style: TextStyle(
//                                 color: Color(0xff1A494F),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         Spacer(),
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Transactions()));
//                           },
//                           child: Container(
//                             margin: EdgeInsets.only(right: 10),
//                             height: 15,
//                             width: 15,
//                             child: Image.asset(
//                               'assets/images/arrow-right.png',
//                               color: Color(0xff1A494F),
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   // margin: EdgeInsets.only(top: 15),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15.0),
//                       color: Color(0xffFFFFFF)),
//                   height: MediaQuery.of(context).size.height * (8 / 100),
//                   width: MediaQuery.of(context).size.width * 0.8,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                           margin: EdgeInsets.only(left: 10),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               color: Color(0xffEEEEEE)),
//                           height: 15,
//                           width: 15,
//                           child: ImageIcon(
//                             AssetImage(
//                               'assets/images/dashboard.png',
//                             ),
//                             size: 10,
//                           )),
//                       Container(
//                         margin: EdgeInsets.only(left: 20),
//                         child: Text(
//                           'Messages',
//                           style: TextStyle(
//                               color: Color(0xff1A494F),
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                       Spacer(),
//                       GestureDetector(
//                         onTap: () {
//                           // Navigator.push(context,
//                           //     MaterialPageRoute(builder: (context) => Profile()));
//                         },
//                         child: Container(
//                           margin: EdgeInsets.only(right: 10),
//                           height: 15,
//                           width: 15,
//                           child: Image.asset(
//                             'assets/images/arrow-right.png',
//                             color: Color(0xff1A494F),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           : Column(
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(
//                       top: 15,
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Color(0xffEEEEEE)),
//                     height: 20,
//                     width: 20,
//                     child: ImageIcon(
//                       AssetImage(
//                         'assets/images/dashboard.png',
//                       ),
//                       size: 10,
//                     )),
//                 Container(
//                     margin: EdgeInsets.only(top: 8),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Color(0xffEEEEEE)),
//                     height: 20,
//                     width: 20,
//                     child: ImageIcon(
//                       AssetImage(
//                         'assets/images/shipmentlistingicon.png',
//                       ),
//                       size: 10,
//                     )),
//                 Container(
//                     margin: EdgeInsets.only(top: 8),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Color(0xffEEEEEE)),
//                     height: 20,
//                     width: 20,
//                     child: ImageIcon(
//                       AssetImage(
//                         'assets/images/transicon.png',
//                       ),
//                       size: 10,
//                     )),
//                 Container(
//                     margin: EdgeInsets.only(top: 8),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10.0),
//                         color: Color(0xffEEEEEE)),
//                     height: 20,
//                     width: 20,
//                     child: ImageIcon(
//                       AssetImage(
//                         'assets/images/dashboard.png',
//                       ),
//                       size: 10,
//                     )),
//               ],
//             ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return Scaffold(
//         body: Container(
//             height: h,
//             width: w,
//             child: Column(children: [
//               Container(
//                 margin: EdgeInsets.only(left: 24, top: 15),
//                 height: 30,
//                 width: w,
//                 color: Color(0xffFFFFFF),
//                 child: Text("Shipment",
//                     style: TextStyle(
//                         color: Color(0xff1A494F),
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold)),
//               ),
//               Row(children: [
//                 InkWell(
//                     onTap: () {
//                       // setState(() {
//                       //   exp = !exp;
//                       // });
//                     },
//                     child: sideBar()),
//                 Container(
//                     height: h,
//                     width: exp ? w * 0.8 : w * 0.8,
//                     color: Color(0xffE5E5E5),
//                     // color: Colors.amber,
//                     child: ListView(
//                       shrinkWrap: true,
//                       // physics: NeverScrollableScrollPhysics(),
//                       children: [
//                         Column(
                          
//                           children: [
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(20, 20, 5, 0),
//                                 child: Text(
//                                   'Market Place > Project overview',
//                                   style: TextStyle(
//                                       color: Colors.black,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),

//  Timeline.tileBuilder(
//         theme: TimelineThemeData(
//           direction: Axis.horizontal,
//           connectorTheme: ConnectorThemeData(
//             space: 30.0,
//             thickness: 5.0,
//           ),
//         ),
//         builder: TimelineTileBuilder.connected(
//           connectionDirection: ConnectionDirection.before,
//           itemExtentBuilder: (_, __) =>
//               MediaQuery.of(context).size.width / _processes.length,
//           oppositeContentsBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 15.0),
//               child: Image.asset(
//                 'assets/images/process_timeline/status${index + 1}.png',
//                 width: 50.0,
//                 color: getColor(index),
//               ),
//             );
//           },
//           contentsBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.only(top: 15.0),
//               child: Text(
//                 _processes[index],
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: getColor(index),
//                 ),
//               ),
//             );
//           },
//           indicatorBuilder: (_, index) {
//             var color;
//             var child;
//             if (index == _processIndex) {
//               color = inProgressColor;
//               child = Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CircularProgressIndicator(
//                   strokeWidth: 3.0,
//                   valueColor: AlwaysStoppedAnimation(Colors.white),
//                 ),
//               );
//             } else if (index < _processIndex) {
//               color = completeColor;
//               child = Icon(
//                 Icons.check,
//                 color: Colors.white,
//                 size: 15.0,
//               );
//             } else {
//               color = todoColor;
//             }

//             if (index <= _processIndex) {
//               return Stack(
//                 children: [
//                   CustomPaint(
//                     size: Size(30.0, 30.0),
//                     painter: _BezierPainter(
//                       color: color,
//                       drawStart: index > 0,
//                       drawEnd: index < _processIndex,
//                     ),
//                   ),
//                   DotIndicator(
//                     size: 30.0,
//                     color: color,
//                     child: child,
//                   ),
//                 ],
//               );
//             } else {
//               return Stack(
//                 children: [
//                   CustomPaint(
//                     size: Size(15.0, 15.0),
//                     painter: _BezierPainter(
//                       color: color,
//                       drawEnd: index < _processes.length - 1,
//                     ),
//                   ),
//                   OutlinedDotIndicator(
//                     borderWidth: 4.0,
//                     color: color,
//                   ),
//                 ],
//               );
//             }
//           },
//           connectorBuilder: (_, index, type) {
//             if (index > 0) {
//               if (index == _processIndex) {
//                 final prevColor = getColor(index - 1);
//                 final color = getColor(index);
//                 List<Color> gradientColors;
//                 if (type == ConnectorType.start) {
//                   gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
//                 } else {
//                   gradientColors = [
//                     prevColor,
//                     Color.lerp(prevColor, color, 0.5)!
//                   ];
//                 }
//                 return DecoratedLineConnector(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: gradientColors,
//                     ),
//                   ),
//                 );
//               } else {
//                 return SolidLineConnector(
//                   color: getColor(index),
//                 );
//               }
//             } else {
//               return null;
//             }
//           },
//           itemCount: _processes.length,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(FontAwesomeIcons.chevronRight),
//         onPressed: () {
//           setState(() {
//             _processIndex = (_processIndex + 1) % _processes.length;
//           });
//         },
//         backgroundColor: inProgressColor,
//       ),





//                           ],
//                         ),
//                       ],
//                     ))
//               ]),
//             ])));
//   }
// }
