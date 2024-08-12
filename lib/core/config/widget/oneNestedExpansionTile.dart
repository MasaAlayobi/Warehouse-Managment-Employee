// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class myNestedExpansionTile extends StatelessWidget {
  String text1;
  String? text2;
  List<Widget> children;
  bool? variable;
  Widget? widget;
  bool isAppearClock = false;
  myNestedExpansionTile({
    Key? key,
    required this.text1,
    this.text2,
    required this.children,
    this.variable,
    this.isAppearClock = false,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        leading: isAppearClock == false
            ? Icon(
                Icons.warehouse,
                color: AppColor.purple3,
              )
            : Lottie.asset("assets/lottie/timer.json",
                fit: BoxFit.contain, width: 33, height: 33),
        title: HeaderText(
            text: text1,
            textcolor: AppColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        backgroundColor: Colors.grey[200],
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        collapsedBackgroundColor: Colors.grey[200],
        textColor: AppColor.purple3,
        iconColor: AppColor.purple3,
        children: children);
  }
}
