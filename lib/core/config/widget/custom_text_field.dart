// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String? validatorText;
  String? nameText;
  final GestureTapCallback? ontapIcon;
  final bool readOnly;
  final String? label;
  final IconData? icon;
  CustomTextField({
    Key? key,
    this.validatorText,
    required this.nameText,

    required this.readOnly,
    this.label,
    this.icon,
    this.nameController, this.ontapIcon,
  }) : super(key: key);

  final TextEditingController? nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      // textAlign: TextAlign.center,
      readOnly: readOnly,
      keyboardType: TextInputType.name,
      cursorColor: AppColor.grey1,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColor.red),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color:AppColor.white),
            borderRadius: BorderRadius.circular(12)),
        fillColor: AppColor.white,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.white),
            borderRadius: BorderRadius.circular(12)),
        border: OutlineInputBorder(
          
            borderSide: BorderSide(color: AppColor.white)),
        hintText: nameText,
        
        suffixIcon: icon!=null?InkWell(
          onTap: ontapIcon,
          child: Icon(icon)):null,
        hintStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: AppColor.grey3),
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 16, color: AppColor.black),
      ),
      validator: (text) {
        if (text!.isEmpty) {
          return validatorText;
        }
        return null;
      },
      controller: nameController,
    );
  }
}
