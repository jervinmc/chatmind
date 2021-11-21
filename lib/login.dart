import 'package:chatmind/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:chatmind/home.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:chatmind/config/global.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'signup/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  const Login({ Key key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static String BASE_URL = ''+Global.url+'/login';
  bool _load = false;
  
  void notify(DialogType type , title, desc){
      AwesomeDialog(
                context: context,
                dialogType:type,
                animType: AnimType.BOTTOMSLIDE,
                title: title,
                desc: desc,
                btnOkOnPress: () {},
                )..show();
    }
  void Login() async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
      var params = {
        "email":_email.text,
        "password":_password.text
      };
      setState(() {
        _load=true;
      });
      final response = await http.post(Uri.parse(BASE_URL),headers: {"Content-Type": "application/json"},body:json.encode(params));
      String jsonsDataString = response.body.toString();
      final _data = jsonDecode(jsonsDataString);
      if(_data['status']==201){
        prefs.setInt("_id",_data['id']);
        prefs.setString("_email",_data['email']);
        setState(() {
          _load=false;
        });
        runApp(Home());
      }
      else{
        notify(DialogType.ERROR, 'Wrong Credentials', "Please try again.");
       setState(() {
         _load=false;
       });
      }
      
  }
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        
      body: Container(
        color: Color(0xff83c5be),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
                  
                  padding: EdgeInsets.all(20),
                  child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/logo.png'),
                        
                        Container(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                       borderRadius: BorderRadius.circular(20.0),
                                  ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                  color: Color(0xff83c5be), 
                                    width: 5.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Email",
                                fillColor: Colors.white70),
                          )
                        ),
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(top: 10),
                          child: TextField(
                                    obscureText: true,
                                    controller: _password,
                                    decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(8.0),enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey, width: 1.5),
                                            borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                        filled: true,
                                        hintStyle: TextStyle(color: Colors.grey[800]),
                                        hintText: "Password",
                                        fillColor: Colors.white70),
                                  )
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff34a0a4)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        ))),
                            child: Text('Login'),
                            onPressed: () {
                            // Login();
                            Navigator.push(
                                  context,
                                  PageTransition(
                                    curve: Curves.linear,
                                    type: PageTransitionType.topToBottom,
                                    child: Home(),
                                  ),
                                );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5),
                          width: 250,
                          child: ElevatedButton(
                              child: Text('Sign up',style: TextStyle(color: Colors.black),),
                            onPressed: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    curve: Curves.linear,
                                    type: PageTransitionType.topToBottom,
                                    // child: SignUp(),
                                  ),
                                );
                            },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        ),
                              primary: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                              textStyle: TextStyle(
                                color: Colors.transparent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                            
                              
                          ),       
                          ),
                           _load ? Container(
                            color: Colors.white10,
                            width: 70.0,
                            height: 70.0,
                            child: new Padding(padding: const EdgeInsets.all(5.0),child: new Center(child: new CircularProgressIndicator())),
                          ) : textSize('',0.0)
                      ],
                  ),
                ),
              
            ],
          ),
      )
    ),
    );
}
}