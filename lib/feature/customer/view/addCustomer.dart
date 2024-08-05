import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldEmail.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/addClient.dart';
import 'package:mobile_warehouse_managment/core/data/location.dart';
import 'package:mobile_warehouse_managment/core/domain/customer_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/view/customer.dart';

import '../../../core/config/widget/myButton.dart';

class AddDetailCustomer extends StatelessWidget {
  AddDetailCustomer({super.key});
  TextEditingController supplier = TextEditingController();
  TextEditingController phone1 = TextEditingController();
  TextEditingController phone2 = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController region = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: const CustomDrawer(),
      appBar: CustomAppbar(
        title: "Add customer",
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
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HeaderText(
                      text: "Customer Information:",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "supplier",
                    nameController: supplier,
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
                    colorOfTextField: AppColor.purple2,
                    nameText: "email",
                    readOnly: false,
                    radius: 8,
                    email: email),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  phoneController: phone1,
                  ReadeOnly: false,
                  phoneText: "phone number 1",
                  maxLength: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                  phoneController: phone2,
                  ReadeOnly: false,
                  phoneText: "phone number 2",
                  maxLength: 10,
                ),
              ),
              const sizedBox50(),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HeaderText(
                      text: "Customer location:",
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "country",
                    nameController: country,
                    readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "city", nameController: city, readOnly: false),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldName(
                    nameText: "region",
                    nameController: region,
                    readOnly: false),
              ),
              sizedBox30(),
              MyButton(
                  title: "save",
                  onpress: () async {
                    if (supplier.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        phone1.text.isNotEmpty) {
                      var response = await CustomerServiceImpl()
                          .addCustomer(AddclientModel(
                        name: supplier.text,
                        email: email.text,
                        location: LocationModel(
                                city: city.text,
                                country: country.text,
                                region: region.text)
                            .toMap(),
                        phones: [
                          {"number": phone1.text},
                          {"number": phone2.text}
                        ],
                      ));
                      if (response == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('create customer successfully')));
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Customer(),
                        ));
                      } else {
                        print(AddclientModel(
                          location: LocationModel(
                                  city: city.text,
                                  country: country.text,
                                  region: region.text)
                              .toMap(),
                          name: supplier.text,
                          email: email.text,
                          phones: [
                            {"number": phone1.text},
                            {"number": phone2.text}
                          ],
                        ).toMap());
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                                'sometheing failed, please try again latter')));
                      }
                    }
                  },
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
