import 'package:flutter/material.dart';
import 'package:shipment/Element/Sidebar.dart';
import 'package:shipment/Element/ViewChatScreen.dart';
import 'package:shipment/Element/Responsive.dart';
import 'package:shipment/pages/Client/Chat/Client_Chat_Screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class ChatIndexData {
  int chatIndex = 0;
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: ClientChatScreen(),
        tablet: ClientChatScreen(),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: SideBar(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 4 : 5,
              child: ClientChatScreen(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 7 : 10,
              child: ChatViewScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
