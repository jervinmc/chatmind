

import 'package:flutter/material.dart';
class textSize extends StatelessWidget {
  final String text;
  final double size;
  const textSize(this.text,this.size);

  @override
  Widget build(BuildContext context) {
    return new Text(text, style: TextStyle(fontSize: size),);
  }
}

class textSizeColor extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const textSizeColor(this.text,this.size,this.color);

  @override
  Widget build(BuildContext context) {
    return new Text(text, style: TextStyle(fontSize: size,color: color),);
  }
}
class textSizeColorBold extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const textSizeColorBold(this.text,this.size,this.color);

  @override
  Widget build(BuildContext context) {
    return new Text(text, style: TextStyle(fontSize: size,color: color,fontWeight: FontWeight.bold),);
  }
}