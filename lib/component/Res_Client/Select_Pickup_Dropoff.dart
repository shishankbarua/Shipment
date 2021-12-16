import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/pages/Client/Dashboard/SelectReceptionist.dart';

class PickupDrop extends StatefulWidget {
  const PickupDrop({Key? key}) : super(key: key);

  @override
  _PickupDropState createState() => _PickupDropState();
}

class _PickupDropState extends State<PickupDrop> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: SelectReceptionist(),
        tablet: SelectReceptionist(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 1 : 4,
              child: SideBar(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: SelectReceptionist(),
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
