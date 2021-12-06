import 'package:chatmind/details/articles.dart';
import 'package:chatmind/utils.dart';
import 'package:flutter/material.dart';
import 'package:chatmind/utils/helpers.dart';
import 'package:chatmind/config/global.dart';
import 'package:page_transition/page_transition.dart';
import 'package:chatmind/details/articles.dart';
class ContentArticle extends StatelessWidget {

  final String _tipTitle ;
  final String _subtitle ;
  final int _likes ;
  final int _reply ;
  const ContentArticle(this._tipTitle,this._subtitle,this._likes,this._reply);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textSizeColorBold(_tipTitle, 15.0, Color(Global.primary)),
          Divider(height: 20.0,),
          Row(
            children: [
              Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textSize('test',10.0)
                  ],
                ),
                )
              ),
               Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textSize('test',10.0)
                  ],
                ),
                )
              ),
               Card(
                child: Container(
                  height: 150,
                  width: 100,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textSize('test',10.0)
                  ],
                ),
                )
              ),
            ],
          ),
          Divider(),
          textSize(_subtitle,15.0),
          Row(
            children: [
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite)),
                  textSize(_likes.toString(),15.0)
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: (){
                      Navigator.push(
                                  context,
                                  PageTransition(
                                    curve: Curves.linear,
                                    type: PageTransitionType.topToBottom,
                                    child: Details(_tipTitle,_subtitle,'hello'),
                                  ),
                                );
                  }, icon: Icon(Icons.reply)),
                  textSize(_reply.toString(),15.0),
                ],
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}