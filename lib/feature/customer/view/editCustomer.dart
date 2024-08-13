import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldEmail.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/detailsACleint.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/map.dart';

import '../../../core/config/widget/myButton.dart';

class EditDetailCustomer extends StatelessWidget {
  DetailsacleintModel? details;
  LatLng? latLng;
  EditDetailCustomer({super.key, this.details, this.latLng});
  TextEditingController customer = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController debtDate = TextEditingController();
  TextEditingController payDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: const CustomDrawer(),
      appBar: CustomAppbar(
        title: "Edit ",
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
                    nameText: details!.name.toString(),
                    nameController: customer,
                    readOnly: false),
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
                    nameText: details!.email.toString(),
                    readOnly: false,
                    radius: 8,
                    email: email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  labelText: "phone 1",
                  phoneController: phone1,
                  ReadeOnly: false,
                  phoneText: details!.phones[0]["number"].toString(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    label: "phone 2",
                    nameText: details!.phones[1]["number"].toString(),
                    nameController: phone2,
                    readOnly: false),
              ),
              sizedBox30(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myButtonWithBorder(
                  fillColor: const Color.fromARGB(255, 239, 235, 235),
                  onTap: () {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => MapPage(
                        isEdit: true,
                      ),
                    ));
                  },
                  textColor: AppColor.purple2,
                  border: Border.all(color: AppColor.purple2),
                  text: "edit your location",
                  fontsize: 16,
                  // width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 18,
                  radius: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              sizedBox30(),
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
