import 'package:flutter/material.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Res_Shipment.dart/Shipment_Sidebar.dart';
import 'package:shipment/pages/Shipment/Settings/Shipment_Settings.dart';
import 'package:shipment/pages/Shipment/Settings/Shipment_Profile_Settings.dart';

class ResShipmentSettings extends StatefulWidget {
  const ResShipmentSettings({Key? key}) : super(key: key);

  @override
  _ResShipmentSettingsState createState() => _ResShipmentSettingsState();
}

class _ResShipmentSettingsState extends State<ResShipmentSettings> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: SettingsShipment(),
        tablet: SettingsShipment(),
        desktop: Row(children: [
          // Once our width is less then 1300 then it start showing errors
          // Now there is no error if our width is less then 1340
          Expanded(
            flex: _size.width > 1340 ? 2 : 4,
            child: ShipmentSidebar(),
          ),
          Expanded(
            flex: _size.width > 1340 ? 5 : 6,
            child: SettingsShipment(),
          ),
          Expanded(
            flex: _size.width > 1340 ? 6 : 9,
            child: ShipmentProfileSettings(),
          ),
        ]),
      ),
    );
  }
}
