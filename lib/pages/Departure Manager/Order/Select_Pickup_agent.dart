import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:shipment/Element/CustomAlertDialog.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/pages/Departure%20Manager/Settings/DepartureSettings.dart';
import 'package:shipment/component/Arrival%20Manager/Sidebar.dart';
import '../../../constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class SelectPickupAgent extends StatefulWidget {
  const SelectPickupAgent({Key? key}) : super(key: key);

  @override
  _SelectPickupAgentState createState() => _SelectPickupAgentState();
}

class _SelectPickupAgentState extends State<SelectPickupAgent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  Color CardColor = Color(0xffF7F6FB);
  bool Iamhovering = false;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: DepartureSettings(),
      ),
      body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          color: Color(0xffE5E5E5),
          child: SafeArea(
              right: false,
              child: ListView(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        if (Responsive.isDesktop(context)) SizedBox(width: 5),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 10, 50, 0),
                          child: Row(
                            children: [
                              Text(
                                'Order> Assigned agent',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Spacer(),
                              if (Responsive.isDesktop(context)) topBar()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (!Responsive.isDesktop(context))
                    Column(
                      children: [topBar(), selectAgent()],
                    ),
                  if (Responsive.isDesktop(context)) selectAgent()
                ],
              ))),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            height: 48,
            width: (Responsive.isDesktop(context))
                ? 349
                : MediaQuery.of(context).size.width * (30 / 100),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Color(0xff90A0B7),
                ),
                Text(
                  "Search",
                  style: headingStyle12greynormal(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: (Responsive.isDesktop(context))
                ? 136
                : MediaQuery.of(context).size.width * (40 / 100),
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.teal, width: 2.0)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '21.08.2021',
                    style: headingStyle12blacknormal(),
                  ),
                  Container(
                    // margin: EdgeInsets.only(left: 45, top: 5),
                    height: 20,
                    width: 20,
                    child: ImageIcon(
                      AssetImage(
                        "images/menu-board.png",
                      ),
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget selectAgent() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xffFFFFFF),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Text(
                "Choose agent",
                style: TextStyle(color: Color(0xff718096)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                    autofocus: true,
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontStyle: FontStyle.italic),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'What are you looking for?'),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await BackendService.getSuggestions(pattern);
                  },
                  itemBuilder: (context, Map<String, String> suggestion) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(suggestion['name']!),
                      // subtitle: Text('\$${suggestion['price']}'),
                    );
                  },
                  onSuggestionSelected: (Map<String, String> suggestion) {
                    // Navigator.of(context).push<void>(MaterialPageRoute(
                    //     builder: (context) => ProductPage(product: suggestion)));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
