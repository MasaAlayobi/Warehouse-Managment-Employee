// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class myTextFieldNumber extends StatelessWidget {
  final String? validatorText;
  final String? phoneText;
  final String? labelText;
  final int? maxLength;
  final bool? ReadeOnly;
  myTextFieldNumber({
    Key? key,
    this.validatorText,
    this.phoneText,
    this.labelText,
    this.maxLength,
    this.ReadeOnly,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      readOnly: ReadeOnly ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      keyboardType: TextInputType.phone,
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
        hintText: phoneText,
        // hintStyle: TextStyle(
        //     fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: AppColor.purple2),
      ),
      controller: phoneController,
      validator: (text) {
        if (text!.isEmpty) {
          return validatorText;
        }
      },
    );
  }
}
