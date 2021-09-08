import 'package:flutter/material.dart';
import 'package:side_navigation/api/side_navigation_bar.dart';
import 'package:side_navigation/api/side_navigation_bar_item.dart';

class DashBoard2 extends StatefulWidget {
  const DashBoard2({Key key}) : super(key: key);

  @override
  _DashBoard2State createState() => _DashBoard2State();
}

class _DashBoard2State extends State<DashBoard2> {
  List<Widget> views = const [
    Center(
      child: Text('Dashboard'),
    ),
    Center(
      child: Text('Shipment Listing'),
    ),
    Center(
      child: Text('Transactions'),
    ),
    Center(
      child: Text('Messages'),
    ),
  ];

  /// The currently selected index of the bar
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Shipment",
          style: TextStyle(color: Color(0xff1A494F)),
        ),
      ),
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            color: Colors.white,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Shipment Listing',
              ),
              SideNavigationBarItem(
                icon: Icons.money,
                label: 'Transactions',
              ),
              SideNavigationBarItem(
                icon: Icons.message,
                label: 'Messages',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: views.elementAt(selectedIndex),
          )
        ],
      ),
    );
  }
}
