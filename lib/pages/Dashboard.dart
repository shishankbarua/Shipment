import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:side_navigation/side_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xffF2F2F2),
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Color(0xFF8bc53f)),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "Shipment",
          style: TextStyle(color: Color(0xff1A494F)),
        ),
      ),
    );
  }
}

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  int _selected;

  void changeSelected(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: new Drawer(
        child: Container(
          color: Color(0xff073952),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150.0,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff073952),
                  ),
                  accountName: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text("Shishank",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.list,
                ),
                title: Text("Expansion Title"),
                children: <Widget>[Text("children 1"), Text("children 2")],
              ),
              ListTile(
                selected: _selected == 1 ? true : false,
                tileColor: Colors.transparent,
                selectedTileColor: Colors.white60,
                leading: Icon(
                  Icons.email,
                  color: Colors.white60,
                ),
                title: Text("My Account",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _selected = 1;
                  setState(() {});

                  // Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyAccount()),
                  // );
                },
              ),
              ListTile(
                selected: _selected == 2 ? true : false,
                tileColor: Colors.transparent,
                selectedTileColor: Colors.white60,
                leading: Icon(
                  Icons.email,
                  color: Colors.white60,
                ),
                title: Text("Messages",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _selected = 2;
                  setState(() {});

                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Messages()),
                  // );
                },
              ),
              ListTile(
                selected: _selected == 3 ? true : false,
                tileColor: Colors.transparent,
                selectedTileColor: Colors.white60,
                leading: Icon(
                  Icons.email,
                  color: Colors.white60,
                ),
                title: Text("Investor Score",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _selected = 3;
                  setState(() {});

                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => InvestorScore()),
                  // );
                },
              ),
              ListTile(
                selected: _selected == 4 ? true : false,
                tileColor: Colors.transparent,
                selectedTileColor: Colors.white60,
                leading: Icon(
                  Icons.description,
                  color: Colors.white60,
                ),
                title: Text("Education",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _selected = 4;
                  setState(() {});
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Education()),
                  // );
                },
              ),
              ListTile(
                selected: _selected == 5 ? true : false,
                leading: Icon(
                  Icons.exit_to_app_outlined,
                  color: Colors.white60,
                ),
                title: Text("Sign out",
                    style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                onTap: () {
                  _selected = 5;
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LoginScreen()),
                  // );
                },
              ),
              ListTile(
                selected: _selected == 6 ? true : false,
                title: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text("Terms and conditions",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  // _selected = 5;
                  // setState(() {});

                  const url = 'https://clickipo.com/terms-conditions';
                  // launchURL(url);
                },
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text("Privacy Policy",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  const url = 'https://clickipo.com/privacy-policy';
                  // launchURL(url);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text("Help",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                onTap: () {
                  const url = 'https://help.clickipo.com/';
                  // launchURL(url);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
