import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'dart:io';
import 'package:exif/exif.dart';
import 'dart:async';
import 'dart:typed_data';
import 'package:exif/exif.dart';
import 'package:flutter/material.dart';
import 'package:chatmind/home/_chatbot.dart';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:page_transition/page_transition.dart';
import 'package:flutter/foundation.dart';
import 'package:chatmind/home/articles/index.dart';
import 'config/global.dart';
class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


int _selectedIndex= 0;
void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==2){
        // Navigator.push(
        //           context,
        //           PageTransition(
        //             curve: Curves.linear,
        //             type: PageTransitionType.topToBottom,
        //             child: ChatPage(),
        //           ),
        //         );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:_selectedIndex == 1 ? Color(Global.primary) : Colors.white,
      body: _selectedIndex == 0 ? ListView(
        children: [
          ContentArticle('1. The early stages of the pandemic and the ensuing lockdowns were hard on all of us, in different ways. Isolation, joblessness, childcare, and many other challenges severely affected the mental well-being of many people around the world. Yet here we are, a year on. How are we coping?','The physical health effects of COVID-19 and the countless deaths the pandemic has claimed have been, and continue to be, devastating on a global scale.',50,12),
          ContentArticle('2. Healthy Ways to Cope with Stress.','including those on social media. It’s good to be informed, but hearing about the pandemic constantly can be upsetting. Consider limiting news to just a couple times a day and disconnecting from phone, tv, and computer screens for a while.',13,20),
        ],
      ) : _selectedIndex == 1 ?ListView() : ChatPage(),
      drawer: Drawer(
        
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black45,
                image: DecorationImage(
                  image: AssetImage("assets/images/mainlogo.png"),
                     fit: BoxFit.cover)
              ),
            ),
            ListTile(
              trailing:  Icon(Icons.people),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              trailing:  Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
              
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor:Color(0xff83c5be),
        title: Text(_selectedIndex == 0 ? 'Articles' : _selectedIndex == 1 ? 'Podcast' : 'Chatbot',style: TextStyle(color: Color(0xff003049)),),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff34a0a4),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article,color: Colors.white,),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack,color: Colors.white,),
            label: 'Podcasts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,color: Colors.white,),
            label: 'Chatbot',
            
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        ),
      
    );
  }
}

