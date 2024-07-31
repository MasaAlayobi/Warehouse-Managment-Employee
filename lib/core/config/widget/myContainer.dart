// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class myContainer extends StatelessWidget {
  double width;
  double height;
  Color color;
  BorderRadiusGeometry? borderRaduis;
  Widget myWidget;
  Border? border;
  myContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
    this.borderRaduis,
    required this.myWidget,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: border, borderRadius: borderRaduis, color: color),
      child: Center(child: myWidget),
    );
  }
}
