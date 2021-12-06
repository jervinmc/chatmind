import 'package:chatmind/ApiServices/services.dart';
import 'package:chatmind/utils.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class Details extends StatefulWidget {
  String _title;
  String _description;
  String _images;
  Details(this._title, this._description, this._images);

  @override
  _DetailsState createState() => _DetailsState(_title, _description, _images);
}

class _DetailsState extends State<Details> {
  String _title;
  String _description;
  String _images;

  _DetailsState(this._title, this._description, this._images);

  final replies = Get.put(Article());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title.toString(),
          style: TextStyle(color: Color(0xff003049)),
        ),
        backgroundColor: Color(0xff83c5be),
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(10),child: textSize(_description, 20),),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff83c5be), width: 5.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Comment Here",
                  fillColor: Colors.white70),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: replies.replies().length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        replies.replies()[index]['email'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Text(
                        replies.replies()[index]['value'],
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
