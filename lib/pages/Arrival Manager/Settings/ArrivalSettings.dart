import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shipment/Element/TextStyle.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/component/Arrival%20Manager/Sidebar.dart';

import 'package:shipment/constants.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class ArrivalSettings extends StatefulWidget {
  const ArrivalSettings({Key? key}) : super(key: key);

  @override
  _ArrivalSettingsState createState() => _ArrivalSettingsState();
}

class _ArrivalSettingsState extends State<ArrivalSettings> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var h, w;
  bool? monVal = false;
  bool? monVal2 = false;
  var exp = true, openSUBMENU = false;
  var exp2 = -1;

  var profileexp = -1;
  var timezoneexp = -1;

  String? category;

  var amount;
  var item = [
    'Europe/Andorra',
    'Asia/Dubai',
    'Asia/Kabul',
    'Europe/Tirane',
    'Asia/Yerevan',
    'Antarctica/Casey',
    'Antarctica/Davis',
    'Antarctica/DumontDUrville', // https://bugs.chromium.org/p/chromium/issues/detail?id=928068
    'Antarctica/Mawson',
    'Antarctica/Palmer',
    'Antarctica/Rothera',
    'Antarctica/Syowa',
    'Antarctica/Troll',
    'Antarctica/Vostok',
    'America/Argentina/Buenos_Aires',
    'America/Argentina/Cordoba',
    'America/Argentina/Salta',
    'America/Argentina/Jujuy',
    'America/Argentina/Tucuman',
    'America/Argentina/Catamarca',
    'America/Argentina/La_Rioja',
    'America/Argentina/San_Juan',
    'America/Argentina/Mendoza',
    'America/Argentina/San_Luis',
    'America/Argentina/Rio_Gallegos',
    'America/Argentina/Ushuaia',
    'Pacific/Pago_Pago',
    'Europe/Vienna',
    'Australia/Lord_Howe',
    'Antarctica/Macquarie',
    'Australia/Hobart',
    'Australia/Currie',
    'Australia/Melbourne',
    'Australia/Sydney',
    'Australia/Broken_Hill',
    'Australia/Brisbane',
    'Australia/Lindeman',
    'Australia/Adelaide',
    'Australia/Darwin',
    'Australia/Perth',
    'Australia/Eucla',
    'Asia/Baku',
    'America/Barbados',
    'Asia/Dhaka',
    'Europe/Brussels',
    'Europe/Sofia',
    'Atlantic/Bermuda',
    'Asia/Brunei',
    'America/La_Paz',
    'America/Noronha',
    'America/Belem',
    'America/Fortaleza',
    'America/Recife',
    'America/Araguaina',
    'America/Maceio',
    'America/Bahia',
    'America/Sao_Paulo',
    'America/Campo_Grande',
    'America/Cuiaba',
    'America/Santarem',
    'America/Porto_Velho',
    'America/Boa_Vista',
    'America/Manaus',
    'America/Eirunepe',
    'America/Rio_Branco',
    'America/Nassau',
    'Asia/Thimphu',
    'Europe/Minsk',
    'America/Belize',
    'America/St_Johns',
    'America/Halifax',
    'America/Glace_Bay',
    'America/Moncton',
    'America/Goose_Bay',
    'America/Blanc-Sablon',
    'America/Toronto',
    'America/Nipigon',
    'America/Thunder_Bay',
    'America/Iqaluit',
    'America/Pangnirtung',
    'America/Atikokan',
    'America/Winnipeg',
    'America/Rainy_River',
    'America/Resolute',
    'America/Rankin_Inlet',
    'America/Regina',
    'America/Swift_Current',
    'America/Edmonton',
    'America/Cambridge_Bay',
    'America/Yellowknife',
    'America/Inuvik',
    'America/Creston',
    'America/Dawson_Creek',
    'America/Fort_Nelson',
    'America/Vancouver',
    'America/Whitehorse',
    'America/Dawson',
    'Indian/Cocos',
    'Europe/Zurich',
    'Africa/Abidjan',
    'Pacific/Rarotonga',
    'America/Santiago',
    'America/Punta_Arenas',
    'Pacific/Easter',
    'Asia/Shanghai',
    'Asia/Urumqi',
    'America/Bogota',
    'America/Costa_Rica',
    'America/Havana',
    'Atlantic/Cape_Verde',
    'America/Curacao',
    'Indian/Christmas',
    'Asia/Nicosia',
    'Asia/Famagusta',
    'Europe/Prague',
    'Europe/Berlin',
    'Europe/Copenhagen',
    'America/Santo_Domingo',
    'Africa/Algiers',
    'America/Guayaquil',
    'Pacific/Galapagos',
    'Europe/Tallinn',
    'Africa/Cairo',
    'Africa/El_Aaiun',
    'Europe/Madrid',
    'Africa/Ceuta',
    'Atlantic/Canary',
    'Europe/Helsinki',
    'Pacific/Fiji',
    'Atlantic/Stanley',
    'Pacific/Chuuk',
    'Pacific/Pohnpei',
    'Pacific/Kosrae',
    'Atlantic/Faroe',
    'Europe/Paris',
    'Europe/London',
    'Asia/Tbilisi',
    'America/Cayenne',
    'Africa/Accra',
    'Europe/Gibraltar',
    'America/Godthab',
    'America/Danmarkshavn',
    'America/Scoresbysund',
    'America/Thule',
    'Europe/Athens',
    'Atlantic/South_Georgia',
    'America/Guatemala',
    'Pacific/Guam',
    'Africa/Bissau',
    'America/Guyana',
    'Asia/Hong_Kong',
    'America/Tegucigalpa',
    'America/Port-au-Prince',
    'Europe/Budapest',
    'Asia/Jakarta',
    'Asia/Pontianak',
    'Asia/Makassar',
    'Asia/Jayapura',
    'Europe/Dublin',
    'Asia/Jerusalem',
    'Asia/Kolkata',
    'Indian/Chagos',
    'Asia/Baghdad',
    'Asia/Tehran',
    'Atlantic/Reykjavik',
    'Europe/Rome',
    'America/Jamaica',
    'Asia/Amman',
    'Asia/Tokyo',
    'Africa/Nairobi',
    'Asia/Bishkek',
    'Pacific/Tarawa',
    'Pacific/Enderbury',
    'Pacific/Kiritimati',
    'Asia/Pyongyang',
    'Asia/Seoul',
    'Asia/Almaty',
    'Asia/Qyzylorda',
    'Asia/Qostanay', // https://bugs.chromium.org/p/chromium/issues/detail?id=928068
    'Asia/Aqtobe',
    'Asia/Aqtau',
    'Asia/Atyrau',
    'Asia/Oral',
    'Asia/Beirut',
    'Asia/Colombo',
    'Africa/Monrovia',
    'Europe/Vilnius',
    'Europe/Luxembourg',
    'Europe/Riga',
    'Africa/Tripoli',
    'Africa/Casablanca',
    'Europe/Monaco',
    'Europe/Chisinau',
    'Pacific/Majuro',
    'Pacific/Kwajalein',
    'Asia/Yangon',
    'Asia/Ulaanbaatar',
    'Asia/Hovd',
    'Asia/Choibalsan',
    'Asia/Macau',
    'America/Martinique',
    'Europe/Malta',
    'Indian/Mauritius',
    'Indian/Maldives',
    'America/Mexico_City',
    'America/Cancun',
    'America/Merida',
    'America/Monterrey',
    'America/Matamoros',
    'America/Mazatlan',
    'America/Chihuahua',
    'America/Ojinaga',
    'America/Hermosillo',
    'America/Tijuana',
    'America/Bahia_Banderas',
    'Asia/Kuala_Lumpur',
    'Asia/Kuching',
    'Africa/Maputo',
    'Africa/Windhoek',
    'Pacific/Noumea',
    'Pacific/Norfolk',
    'Africa/Lagos',
    'America/Managua',
    'Europe/Amsterdam',
    'Europe/Oslo',
    'Asia/Kathmandu',
    'Pacific/Nauru',
    'Pacific/Niue',
    'Pacific/Auckland',
    'Pacific/Chatham',
    'America/Panama',
    'America/Lima',
    'Pacific/Tahiti',
    'Pacific/Marquesas',
    'Pacific/Gambier',
    'Pacific/Port_Moresby',
    'Pacific/Bougainville',
    'Asia/Manila',
    'Asia/Karachi',
    'Europe/Warsaw',
    'America/Miquelon',
    'Pacific/Pitcairn',
    'America/Puerto_Rico',
    'Asia/Gaza',
    'Asia/Hebron',
    'Europe/Lisbon',
    'Atlantic/Madeira',
    'Atlantic/Azores',
    'Pacific/Palau',
    'America/Asuncion',
    'Asia/Qatar',
    'Indian/Reunion',
    'Europe/Bucharest',
    'Europe/Belgrade',
    'Europe/Kaliningrad',
    'Europe/Moscow',
    'Europe/Simferopol',
    'Europe/Kirov',
    'Europe/Astrakhan',
    'Europe/Volgograd',
    'Europe/Saratov',
    'Europe/Ulyanovsk',
    'Europe/Samara',
    'Asia/Yekaterinburg',
    'Asia/Omsk',
    'Asia/Novosibirsk',
    'Asia/Barnaul',
    'Asia/Tomsk',
    'Asia/Novokuznetsk',
    'Asia/Krasnoyarsk',
    'Asia/Irkutsk',
    'Asia/Chita',
    'Asia/Yakutsk',
    'Asia/Khandyga',
    'Asia/Vladivostok',
    'Asia/Ust-Nera',
    'Asia/Magadan',
    'Asia/Sakhalin',
    'Asia/Srednekolymsk',
    'Asia/Kamchatka',
    'Asia/Anadyr',
    'Asia/Riyadh',
    'Pacific/Guadalcanal',
    'Indian/Mahe',
    'Africa/Khartoum',
    'Europe/Stockholm',
    'Asia/Singapore',
    'America/Paramaribo',
    'Africa/Juba',
    'Africa/Sao_Tome',
    'America/El_Salvador',
    'Asia/Damascus',
    'America/Grand_Turk',
    'Africa/Ndjamena',
    'Indian/Kerguelen',
    'Asia/Bangkok',
    'Asia/Dushanbe',
    'Pacific/Fakaofo',
    'Asia/Dili',
    'Asia/Ashgabat',
    'Africa/Tunis',
    'Pacific/Tongatapu',
    'Europe/Istanbul',
    'America/Port_of_Spain',
    'Pacific/Funafuti',
    'Asia/Taipei',
    'Europe/Kiev',
    'Europe/Uzhgorod',
    'Europe/Zaporozhye',
    'Pacific/Wake',
    'America/New_York',
    'America/Detroit',
    'America/Kentucky/Louisville',
    'America/Kentucky/Monticello',
    'America/Indiana/Indianapolis',
    'America/Indiana/Vincennes',
    'America/Indiana/Winamac',
    'America/Indiana/Marengo',
    'America/Indiana/Petersburg',
    'America/Indiana/Vevay',
    'America/Chicago',
    'America/Indiana/Tell_City',
    'America/Indiana/Knox',
    'America/Menominee',
    'America/North_Dakota/Center',
    'America/North_Dakota/New_Salem',
    'America/North_Dakota/Beulah',
    'America/Denver',
    'America/Boise',
    'America/Phoenix',
    'America/Los_Angeles',
    'America/Anchorage',
    'America/Juneau',
    'America/Sitka',
    'America/Metlakatla',
    'America/Yakutat',
    'America/Nome',
    'America/Adak',
    'Pacific/Honolulu',
    'America/Montevideo',
    'Asia/Samarkand',
    'Asia/Tashkent',
    'America/Caracas',
    'Asia/Ho_Chi_Minh',
    'Pacific/Efate',
    'Pacific/Wallis',
    'Pacific/Apia',
    'Africa/Johannesburg'
  ];
  final TextEditingController _controllr = new TextEditingController();

  var passwordexp = -1;

  List<ExpansionpanelItem> items = <ExpansionpanelItem>[
    ExpansionpanelItem(
        isExpanded: false,
        title: 'User Management',
        content: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Color(0xffFFFFFF)),
                          // height: MediaQuery.of(context).size.height * 0.12,
                          height: 97,
                          width: 373,
                          // width: MediaQuery.of(context).size.width * 0.9,
                          // color: Colors.lime,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  child: Image.asset(
                                      'assets/images/Ellipse7.png',
                                      fit: BoxFit.fill),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          child: Text(("Shishank"),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              )),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, right: 10),
                                          child: Text(("Lunch"),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              softWrap: false,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              )),
                                        ),
                                        // Align(
                                        //   alignment:
                                        //       Alignment.bottomRight,
                                        //   child: Container(
                                        //       height: 15,
                                        //       width: 20,
                                        //       decoration:
                                        //           BoxDecoration(
                                        //               // borderRadius: BorderRadius.circular(50),
                                        //               shape: BoxShape
                                        //                   .circle,
                                        //               color: Color(
                                        //                   0xffFF2828)),
                                        //       // margin: EdgeInsets.only(right: 10),
                                        //       child: Center(
                                        //         child: Text(
                                        //           "1",
                                        //           style: TextStyle(
                                        //               fontSize: 8),
                                        //         ),
                                        //       )),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
            ])),
        leading: Icon(Icons.person, color: Color(0xff1A494F))),
  ];

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        drawer: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 250),
          child: ArrivalSidebar(),
        ),
        body: Container(
          padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
          color: Color(0xffE5E5E5),
          child: SafeArea(
              right: false,
              child: ListView(children: [
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
                      // if (Responsive.isDesktop(context)) SizedBox(width: 5),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 5, 0),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  Column(
                    children: [
                      profileProgress(),
                      userManagement(),
                    ],
                  ),
                if (Responsive.isMobile(context))
                  Column(
                    children: [
                      profileProgress(),
                      userManagement(),
                      profileExpand(),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                            height: 36,
                          )),
                      passwordExpand(),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                            height: 36,
                          )),
                      notificationExpand(),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                            height: 36,
                          )),
                      timezoneExpand(),
                      Container(
                          margin: const EdgeInsets.only(left: 15.0, right: 5.0),
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                            height: 36,
                          )),
                      deleteAccountxpand(),
                    ],
                  )
              ])),
        ));
  }

  Widget profileProgress() {
    return Container(
        margin: EdgeInsets.all(15),
        height: 200,
        width: MediaQuery.of(context).size.width * (90 / 100),
        decoration: BoxDecoration(color: Color(0xff1A494F)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Image.asset('assets/images/Group 413.png'),
                  height: 150,
                  width: 100),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50, left: 10),
                        child: Text("Profile Infotmation",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        child: Text("Shishank.barua@gmail.com",
                            style: TextStyle(
                              color: Color(0xff90A0B7),
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            )),
                      ),
                      Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Color(0xffFFFFFF)),
                          margin: EdgeInsets.only(left: 10, top: 15),
                          child: Center(
                            child: Text(
                              "Complete your profile",
                              style: TextStyle(
                                  color: Color(0xff1A494F),
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget userManagement() {
    return Container(
      // color: Color(0xffE5E5E5),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              items[index].isExpanded = !items[index].isExpanded;
            });
          },
          children: items.map((ExpansionpanelItem item) {
            return ExpansionPanel(
              backgroundColor: Color(0xffE5E5E5),
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    leading: item.leading,
                    title: Text(
                      item.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A494F)),
                    ));
              },
              isExpanded: item.isExpanded,
              body: item.content,
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget profileExpand() {
    return InkWell(
      onTap: () {
        setState(() {
          profileexp == -1 ? profileexp = 0 : profileexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      onDoubleTap: () {
        setState(() {
          profileexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffE5E5E5),
        ),
        margin: EdgeInsets.only(right: 10),
        height: profileexp == 0 ? h * 0.45 : h * 0.13,
        width: w,
        child: Column(
          children: [
            profileexp != 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Profile", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text("Name, Surname, Email address",
                                style: headingStyle16NBLightGrey())),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Profile", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text("Name, Surname, Email address",
                                style: headingStyle16NBLightGrey())),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 500,
                          child: TextFormField(
                            initialValue: "", // autofocus: false,
                            // maxLines: 3,
                            onChanged: (v) {},
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  // borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                // border: InputBorder.none,
                                hintText: "Shishank",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          width: 500,
                          child: TextFormField(
                            initialValue: "", // autofocus: false,
                            // maxLines: 3,
                            onChanged: (v) {},
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  // borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                // border: InputBorder.none,
                                hintText: "Barua",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: 500,
                          margin: EdgeInsets.only(top: 10, left: 15),
                          child: TextFormField(
                            initialValue: "", // autofocus: false,
                            // maxLines: 3,
                            onChanged: (v) {},
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  // borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                // border: InputBorder.none,
                                hintText: "Shishank.barua@gmail.com",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color(0xff1A494F)),
                            margin: EdgeInsets.only(left: 15, top: 15),
                            child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget passwordExpand() {
    return InkWell(
      onTap: () {
        setState(() {
          passwordexp == -1 ? passwordexp = 0 : passwordexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      onDoubleTap: () {
        setState(() {
          passwordexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffE5E5E5),
        ),
        margin: EdgeInsets.only(right: 10),
        height: passwordexp == 0 ? h * 0.38 : h * 0.13,
        width: w,
        child: Column(
          children: [
            passwordexp != 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Password", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                                "Your email address is dmataraci@gmail.com",
                                style: headingStyle16NBLightGrey())),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Password", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                                "Your email address is dmataraci@gmail.com",
                                style: headingStyle16NBLightGrey())),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          width: 500,
                          child: TextFormField(
                            initialValue: "", // autofocus: false,
                            // maxLines: 3,
                            onChanged: (v) {},
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  // borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                // border: InputBorder.none,
                                hintText: "Current Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          width: 500,
                          child: TextFormField(
                            initialValue: "", // autofocus: false,
                            // maxLines: 3,
                            onChanged: (v) {},
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                            decoration: InputDecoration(
                                fillColor: Color(0xffF5F6FA),
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedBorder: new OutlineInputBorder(
                                  // borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1.2, color: Color(0xffF5F6FA)),
                                ),
                                // border: InputBorder.none,
                                hintText: "New Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Color(0xff1A494F)),
                            margin: EdgeInsets.only(left: 15, top: 15),
                            child: Center(
                              child: Text(
                                "Update Password",
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget checkBox() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, top: 5, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  activeColor: Color(0xff1A494F),
                  value: monVal2,
                  onChanged: (bool? value) async {
                    setState(() {
                      monVal2 = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Text("Receive weekly digest mails",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Theme(
                data: Theme.of(context)
                    .copyWith(unselectedWidgetColor: Colors.white),
                child: Checkbox(
                  activeColor: Color(0xff1A494F),
                  value: monVal,
                  onChanged: (bool? value) async {
                    setState(() {
                      monVal = value;
                    });
                  },
                ),
              ),
              Text("Receive new rating announcements",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ],
    );
  }

  Widget notificationExpand() {
    return InkWell(
      onTap: () {
        setState(() {
          exp2 == -1 ? exp2 = 0 : exp2 = -1;
          log("EXP2 >> $exp2");
        });
      },
      onDoubleTap: () {
        setState(() {
          exp2 = -1;
          log("EXP2 >> $exp2");
        });
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffE5E5E5),
        ),
        margin: EdgeInsets.only(right: 10),
        height: exp2 == 0 ? h * 0.30 : h * 0.13,
        width: w,
        child: Column(
          children: [
            exp2 != 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Notification",
                                  style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text("Rateit will send you notifications",
                                style: headingStyle16NBLightGrey())),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child: Text("Notification",
                                  style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_up_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text("Rateit will send you notifications",
                                style: headingStyle16NBLightGrey())),
                      ),
                      checkBox()
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget timezoneExpand() {
    return InkWell(
      onTap: () {
        setState(() {
          timezoneexp == -1 ? timezoneexp = 0 : timezoneexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      onDoubleTap: () {
        setState(() {
          timezoneexp = -1;
          log("EXP2 >> $exp2");
        });
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffE5E5E5),
        ),
        margin: EdgeInsets.only(right: 10),
        height: timezoneexp == 0 ? h * 0.30 : h * 0.13,
        width: w,
        child: Column(
          children: [
            timezoneexp != 0
                ? Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Time Zone", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_down_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                                "Your timezone is currently set to: Pacific Time (US)",
                                style: headingStyle16NBLightGrey())),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 15, top: 10),
                              child:
                                  Text("Time Zone", style: headingStyleBold())),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 0.5, color: Colors.black),
                                // borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xff1A494F)),
                            child: Center(
                              child: Icon(Icons.arrow_drop_up_outlined,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                                "Your timezone is currently set to: Pacific Time (US)",
                                style: headingStyle16NBLightGrey())),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16, right: 10),
                        decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.grey))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                new Expanded(
                                  child: new TextField(
                                    enabled: false,
                                    controller: _controllr,
                                  ),
                                ),
                                new PopupMenuButton<String>(
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onSelected: (String value) {
                                    category = value;
                                    _controllr.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return item.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return new PopupMenuItem(
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  (90 / 100),
                                              child: new Text(value)),
                                          value: value);
                                    }).toList();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget deleteAccountxpand() {
    return InkWell(
      onTap: () {
        // setState(() {
        //   timezoneexp == -1 ? timezoneexp = 0 : timezoneexp = -1;
        //   log("EXP2 >> $exp2");
        // });
      },
      // onDoubleTap: () {
      //   setState(() {
      //     timezoneexp = -1;
      //     log("EXP2 >> $exp2");
      //   });
      // },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xffE5E5E5),
        ),
        margin: EdgeInsets.only(right: 10),
        height: timezoneexp == 0 ? h * 0.30 : h * 0.10,
        width: w,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    child: Text("Delete Account", style: headingStyleBold())),
                Spacer(),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      height: 25,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xff1A494F)),
                      margin: EdgeInsets.only(left: 15, top: 15),
                      child: Center(
                        child: Text(
                          "Deactivate",
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w400),
                        ),
                      )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 15, top: 10),
                  child: Text("If you no longer  want to receive emails..",
                      style: headingStyle16NBLightGrey())),
            )
          ],
        ),
      ),
    );
  }
}

class ExpansionpanelItem {
  bool isExpanded;
  final String title;
  final Widget content;
  final Icon leading;

  ExpansionpanelItem(
      {required this.isExpanded,
      required this.title,
      required this.content,
      required this.leading});
}
