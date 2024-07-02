import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/widget/widget_product_stripped.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/notStripped/widget/widget_product_not_stripped.dart';

class NotStrippedView extends StatelessWidget {
  const NotStrippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            '    All Product :',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Expanded(child: ListView.builder(itemBuilder:(context, index) {
            return WidgetProductNotStripped(image: 'assets/images/Rectangle (4).png',title: 'product name',subTitle:"Price :119.99\$",subTitle2: "Quantity:1200",);
          }, ))
        ],
      ),
    );
  }
}