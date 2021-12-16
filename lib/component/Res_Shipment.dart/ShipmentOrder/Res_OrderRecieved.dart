import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Shipment.dart/Shipment_Sidebar.dart';
import 'package:shipment/pages/Shipment/Orders/order_Recieved.dart';

class ResOrderRecieved extends StatefulWidget {
  const ResOrderRecieved({Key? key}) : super(key: key);

  @override
  _ResOrderRecievedState createState() => _ResOrderRecievedState();
}

class _ResOrderRecievedState extends State<ResOrderRecieved> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: Ordersrecieved(),
        tablet: Ordersrecieved(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child: ShipmentSidebar(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: Ordersrecieved(),
            ),
            // Expanded(
            //   flex: _size.width > 1340 ? 8 : 10,
            //   child: EmailScreen(),
            // ),
          ],
        ),
      ),
    );
  }
}
