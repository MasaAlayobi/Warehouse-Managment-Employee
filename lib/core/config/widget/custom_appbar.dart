import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_button.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  CustomAppbar({super.key, required this.isnNotification, this.title});
  final bool isnNotification;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColor.purple4,
        centerTitle: true,
        title: title!=null? 
        Text('$title',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: AppColor.purple1),)
        :null,
        actions: [
          if(isnNotification==true)
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CustomButton(
              onpress: () {},
              colors: AppColor.purple5,
              width: 37,
              height: 37,
              radius: 8,
              icon: Icons.notifications_outlined,
              colorIcon: AppColor.white,
            ),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
          child: CustomButton(
            onpress: () {
              Scaffold.of(context).openDrawer();
              // _scaffoldKey.currentState!.openDrawer();
            },
            colors: AppColor.purple5,
            width: 30,
            height: 10,
            radius: 8,
            icon: Icons.list,
            colorIcon: AppColor.white,
          ),
        ),
      );
  }
   Size get preferredSize => Size.fromHeight(kToolbarHeight);
}