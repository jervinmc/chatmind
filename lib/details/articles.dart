import 'package:chatmind/utils.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Details extends StatefulWidget {
  String _title;
  String _description;
  String _images;
  Details(this._title,this._description,this._images);

  @override
  _DetailsState createState() => _DetailsState(_title,_description,_images);
}

class _DetailsState extends State<Details> {
  String _title;
  String _description;
  String _images;
  
  
  _DetailsState(this._title,this._description,this._images);
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title.toString(),style: TextStyle(color: Color(0xff003049)),),backgroundColor:Color(0xff83c5be),),
      body: ListView(
        children: [
          textSize("hello", 20)
        ],
      ),
    );
  }
}