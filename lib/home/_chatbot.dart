import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            getSenderView(
                ChatBubbleClipper7(type: BubbleType.sendBubble), context),
            getReceiverView(
                ChatBubbleClipper7(type: BubbleType.receiverBubble), context),
            getReceiverView(
                ChatBubbleClipper7(type: BubbleType.receiverBubble), context),
            getReceiverView(
                ChatBubbleClipper7(type: BubbleType.receiverBubble), context),
            getReceiverView(
                ChatBubbleClipper7(type: BubbleType.receiverBubble), context),
            getReceiverView(
                ChatBubbleClipper7(type: BubbleType.receiverBubble), context),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.only(right: 15 ,left: 15, bottom: 15),
              child: TextField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(20.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff83c5be), width: 5.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Enter text here.",
              fillColor: Colors.white70),
        ),
            )
          ],
        ),
     
        
      ],
    );
  }

  getSenderView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 20),
        backGroundColor: Colors.blue,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  getReceiverView(CustomClipper clipper, BuildContext context) => ChatBubble(
        clipper: clipper,
        backGroundColor: Color(0xffE7E7ED),
        margin: EdgeInsets.only(top: 20),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat",
            style: TextStyle(color: Colors.black),
          ),
        ),
      );
}
