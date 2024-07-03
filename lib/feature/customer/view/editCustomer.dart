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

class EditDetailCustomer extends StatelessWidget {
  EditDetailCustomer({super.key});
  TextEditingController customer = TextEditingController();
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
        ispop: true,
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
                    label: "customer",
                    nameText: "Dania Bakoura",
                    nameController: customer,
                    readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  labelText: "phone",
                  phoneController: phone,
                  ReadeOnly: false,
                  phoneText: "0959585797",
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
                    label: "email",
                    colorOfTextField: AppColor.purple2,
                    nameText: "rdwa516@gmail.com",
                    readOnly: false,
                    radius: 8,
                    email: email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    label: "location",
                    nameText: "damas",
                    nameController: position,
                    readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  labelText: "total",
                  phoneController: total,
                  ReadeOnly: false,
                  phoneText: "50000 SP",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldDate(
                  circular: 12,
                  readOnly: false,
                  nameController: debtDate,
                  label: "dapt date",
                  hintName: "2012/12/12",
                  fillColor: Colors.grey[200],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldDate(
                  circular: 12,
                  readOnly: false,
                  nameController: payDate,
                  label: "pay date",
                  hintName: "2011/11/11",
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
