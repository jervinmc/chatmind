
import 'package:chatmind/login.dart';
import 'package:chatmind/signup/index.dart';
import 'package:chatmind/starting/views/starting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
      ),
      getPages: [
        GetPage(name: "/starting", page:()=>Starting()),
        GetPage(name: "/login", page:()=>Login()),
        GetPage(name: "/signup", page:()=>SignUp()),
        
        // GetPage(name: "/home", page:()=>Home()),
        // GetPage(name: "/products", page:()=>Products()),
        // GetPage(name: "/cart", page:()=>Cart()),
        // GetPage(name: "/favorites", page:()=>Favorites()),
        // GetPage(name: "/product_details", page:()=>ProductDetails()),
      ],
      initialRoute: "/starting",
    );
  }
}
