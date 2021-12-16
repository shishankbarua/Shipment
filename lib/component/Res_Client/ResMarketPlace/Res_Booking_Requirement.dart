import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/pages/Client/MarketPlace/CreateBooking/Booking_Requirement.dart';

class ResBookingRequirement extends StatefulWidget {
  const ResBookingRequirement({Key? key}) : super(key: key);

  @override
  _ResBookingRequirementState createState() => _ResBookingRequirementState();
}

class _ResBookingRequirementState extends State<ResBookingRequirement> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: BookingRequirement(),
        tablet: BookingRequirement(),
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
              child: BookingRequirement(),
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
