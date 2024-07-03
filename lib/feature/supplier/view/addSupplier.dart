import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldEmail.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

import '../../../core/config/widget/myButton.dart';

class AddDetailSupplier extends StatelessWidget {
  AddDetailSupplier({super.key});
  TextEditingController supplier = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController debtDate = TextEditingController();
  TextEditingController payDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: const CustomDrawer(),
      appBar: CustomAppbar(
        title: "Edit",
        isnNotification: false,
        isBackarrow: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.height / 6,
                    child: Image.asset(
                      "assets/images/img.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const sizedBox50(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "supplier",
                    nameController: supplier,
                    readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  phoneController: phone,
                  ReadeOnly: false,
                  phoneText: "phone",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldEmail(
                    validatorText: (text) {
                      if (text!.isEmpty) {
                        return "required";
                      }
                      final regexp = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                      if (!regexp.hasMatch(text)) {
                        return "write email in correct way";
                      }
                      return " ";
                    },
                    colorOfTextField: AppColor.purple2,
                    nameText: "email",
                    readOnly: false,
                    radius: 8,
                    email: email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "location",
                    nameController: position,
                    readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  phoneController: total,
                  ReadeOnly: false,
                  phoneText: "total",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldDate(
                  circular: 12,
                  readOnly: false,
                  nameController: debtDate,
                  hintName: "dapt date",
                  fillColor: Colors.grey[200],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldDate(
                  circular: 12,
                  readOnly: false,
                  nameController: payDate,
                  hintName: "pay date",
                  fillColor: Colors.grey[200],
                ),
              ),
              MyButton(
                  title: "save",
                  onpress: () {},
                  colors: AppColor.purple3,
                  fontsize: 20,
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 15,
                  radius: 12),
              const sizedBox15()
            ],
          ),
        ),
      ),
    );
  }
}
