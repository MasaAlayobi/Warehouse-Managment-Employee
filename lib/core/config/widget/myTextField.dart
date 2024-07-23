import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class myTextFieldName extends StatelessWidget {
  final String? validatorText;
  String nameText;
  final bool readOnly;
  final String? label;
  myTextFieldName({
    super.key,
    this.validatorText,
    required this.nameText,
    required this.nameController,
    required this.readOnly,
    this.label,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: TextInputType.name,
      cursorColor: AppColor.purple2,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: AppColor.purple2),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.purple2),
            borderRadius: BorderRadius.circular(12)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.purple2),
            borderRadius: BorderRadius.circular(12)),
        fillColor: Colors.grey[200],
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.purple2),
            borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.purple2),
            borderRadius: BorderRadius.circular(12)),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: AppColor.purple2)),
        hintText: nameText,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(fontSize: 16, color: AppColor.purple2),
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
