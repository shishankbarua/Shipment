import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/pages/Client/Review/ClientReview.dart';

class ClientReviewRes extends StatefulWidget {
  const ClientReviewRes({Key? key}) : super(key: key);

  @override
  _ClientReviewResState createState() => _ClientReviewResState();
}

class _ClientReviewResState extends State<ClientReviewRes> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ClientReview(),
        tablet: ClientReview(),
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
              child: ClientReview(),
            ),
          ],
        ),
      ),
    );
  }
}
