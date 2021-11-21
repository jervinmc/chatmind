import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatmind/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  List<PageViewModel> getPages(){
    return[
      PageViewModel(
        image: Image.asset('assets/images/logo.png'),
        // image: Image.network('https://image.freepik.com/free-vector/young-woman-holding-big-heart_74855-16979.jpg'),
        title: "Welcome to mind over matter",
        body: "You don't know to control your thoughts. You just have to stop letting them controll.",
        footer: Text('-Don Mullan'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      ),
      PageViewModel(
        image: Image.network('assets/images/mainlogo.png'),
        title: 'Learn coding online',
        body: 'Subscribe to Divine Coding to learn coding',
        footer: Text('@Divine Coding'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      ),
      PageViewModel(
        image: Image.network('https://img.freepik.com/free-vector/family-couple-psychologist-session-flat-cartoon-vector-illustration-isolated_181313-1619.jpg?size=338&ext=jpg'),
        title: 'Learn coding online',
        body: 'Subscribe to Divine Coding to learn coding',
        footer: Text('@Divine Coding'),
        decoration: const PageDecoration(
          pageColor: Color(0xff83c5be),
        ),
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.red
      ),
      
      home: new Scaffold(
        body: IntroductionScreen(
          done:Text('Done',style: TextStyle(color: Colors.black),),
          onDone: (){
            Navigator.push(
                  context,
                  PageTransition(
                    curve: Curves.linear,
                    type: PageTransitionType.topToBottom,
                    child: Login(),
                  ),
                );
          },
          pages: getPages(),
        ),
      ),
      
    );
  }
  
}

