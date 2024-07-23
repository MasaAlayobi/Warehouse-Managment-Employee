// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class myTextFieldEmail extends StatelessWidget {
  final Color colorOfTextField;
  final FormFieldValidator<String>? validatorText;
  final String nameText;
  final bool readOnly;
  final String? label;
  final double radius;
  const myTextFieldEmail({
    Key? key,
    required this.colorOfTextField,
    this.validatorText,
    required this.nameText,
    required this.readOnly,
    this.label,
    required this.radius,
    required this.email,
  }) : super(key: key);

  final TextEditingController email;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      cursorColor: colorOfTextField,
      decoration: InputDecoration(
        errorStyle: TextStyle(color: colorOfTextField),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorOfTextField),
            borderRadius: BorderRadius.circular(radius)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorOfTextField),
            borderRadius: BorderRadius.circular(radius)),
        fillColor: Colors.grey[200],
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorOfTextField),
            borderRadius: BorderRadius.circular(radius)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorOfTextField),
            borderRadius: BorderRadius.circular(radius)),
        border:
            OutlineInputBorder(borderSide: BorderSide(color: colorOfTextField)),
        hintText: nameText,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: TextStyle(color: colorOfTextField),
      ),
      validator: validatorText,
      controller: email,
    );
  }
}
