import 'package:flutter/material.dart';
import 'package:shipment/Element/ViewChatScreen.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Shipment.dart/Shipment_Sidebar.dart';
import 'package:shipment/pages/Shipment/Chat/Shipment_ChatScreen.dart';

class ResChatScreenShipment extends StatefulWidget {
  @override
  _ResChatScreenShipmentState createState() => _ResChatScreenShipmentState();
}

class _ResChatScreenShipmentState extends State<ResChatScreenShipment> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ChatScreenShipment(),
        tablet: ChatScreenShipment(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: ShipmentSidebar(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: ChatScreenShipment(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 7 : 10,
              child: ChatViewScreen(),
            )
          ],
        ),
      ),
    );
  }
}
