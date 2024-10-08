import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class CustomSearch extends StatelessWidget {
    final String? validatorText;
  final String nameText;
  final bool readOnly;
  final String? label;
  final TextEditingController nameController;
  final Function(String)? onChanged;
  
  const CustomSearch({super.key, this.validatorText, required this.nameText, required this.readOnly, this.label, required this.nameController, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      readOnly: readOnly,
      onSubmitted: onChanged,
      keyboardType: TextInputType.name,
      cursorColor: AppColor.grey1,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
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
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 16, color: AppColor.black),
      ),
      
      controller: nameController,
    );
  }
}