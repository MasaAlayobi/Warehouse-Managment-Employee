import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/widget/widget_product_stripped.dart';

class StrippedView extends StatelessWidget {
  const StrippedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
       body: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          SizedBox(height: 10,),
           Text(
            '   All Product :',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              itemBuilder: 
            (context, index) {
              return WidgetProductStripped(image: 'assets/images/Rectangle (4).png',title: 'product name',subTitle:"Price :119.99\$",subtitle2: "Quantity:1200",);
            },),
          )
        ],
      ),
      
    );
  }
}