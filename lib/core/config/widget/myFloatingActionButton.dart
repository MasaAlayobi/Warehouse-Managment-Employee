import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class myFloatingActionButtton extends StatelessWidget {
  Widget image;
  void Function() onPress;
  myFloatingActionButtton({
    super.key,
    required this.image,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.9, 0.97),
      child: FloatingActionButton(
          child: image, backgroundColor: AppColor.purple4, onPressed: onPress),
    );
  }
}
