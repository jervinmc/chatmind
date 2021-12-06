import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatmind/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Starting extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

    void pageValidation()async {
      final prefs = await SharedPreferences.getInstance();
     print(prefs.getBool("isStarted"));
    
     bool isStarted=false;
     if(prefs.getBool("isStarted")==null){
      isStarted=false;
     }
     else{
       isStarted=prefs.getBool("isStarted");
     }
     if(isStarted) {
       Navigator.pop(context);
       Get.toNamed('/login');
     }
  }

  @override
  void initState() {
    super.initState();
    pageValidation();
  }

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Image.asset('assets/images/logo.png'),
        // image: Image.network('https://image.freepik.com/free-vector/young-woman-holding-big-heart_74855-16979.jpg'),
        title: "Welcome to mind over matter",
        body:
            "You don't know to control your thoughts. You just have to stop letting them controll.",
        footer: Text('-Don Mullan'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      ),
      PageViewModel(
        title: '',
        image: Image.asset('assets/images/logo.png'),
        body: 'Take your time healing, as long as you want. Nobody else knows what you’ve been through. How could they know how long it will take to heal you?',
        footer: Text(' — Abertoli'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      ),
      PageViewModel(
        title: '',
        image: Image.asset('assets/images/logo.png'),
        body: 'Your illness is not your identity. Your chemistry is not your character.',
        footer: Text(' — Rick Warren'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primaryColor: Colors.red),
      home: new Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(color: Colors.black),
          ),
          onDone: () async{
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool("isStarted", true);
            Get.toNamed('/login');
          },
          pages: getPages(),
        ),
      ),
    );
  }
}
