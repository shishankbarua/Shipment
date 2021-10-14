import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Responsive.dart';
import 'package:shipment/pages/Client/Dashboard/Goods_Details.dart';

class GoodsInfo extends StatefulWidget {
  const GoodsInfo({Key? key}) : super(key: key);

  @override
  _GoodsInfoState createState() => _GoodsInfoState();
}

class _GoodsInfoState extends State<GoodsInfo> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: GoodsDetails(),
        tablet: GoodsDetails(),
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
              child: GoodsDetails(),
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
