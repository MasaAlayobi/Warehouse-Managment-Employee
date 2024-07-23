import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class myTextFieldDate extends StatelessWidget {
  final String? validatorText;
  final String? hintName;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? label;
  final TextStyle? hintStyle;
  final Color? fillColor;
  double circular = 12;
  myTextFieldDate({
    super.key,
    this.fillColor,
    this.suffixIcon,
    this.hintStyle,
    required this.circular,
    this.validatorText,
    this.hintName,
    required this.nameController,
    required this.readOnly,
    this.label,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      keyboardType: TextInputType.datetime,
      cursorColor: AppColor.purple4,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        iconColor: AppColor.grey1,
        errorStyle: const TextStyle(color: AppColor.purple4),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.purple4),
            borderRadius: BorderRadius.circular(circular)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.purple4),
            borderRadius: BorderRadius.circular(circular)),
        fillColor: fillColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.purple4),
            borderRadius: BorderRadius.circular(circular)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.purple4),
            borderRadius: BorderRadius.circular(circular)),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.purple4)),
        hintText: hintName,
        hintStyle: hintStyle,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(fontSize: 16, color: AppColor.purple4),
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
