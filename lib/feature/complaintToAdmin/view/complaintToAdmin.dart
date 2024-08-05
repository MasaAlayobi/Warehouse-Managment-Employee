import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/domain/complaintToAdmin.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class ComplainToAdminView extends StatelessWidget {
  ComplainToAdminView({super.key});
  TextEditingController complient = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColor.purple1,
      appBar: CustomAppbar(
          isnNotification: false, title: "Your complient", ispop: true),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBox15(),
                Icon(Icons.message,
                    color: AppColor.purple4,
                    size: MediaQuery.of(context).size.width / 3),
                sizedBox15(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: HeaderText(
                      text: "Send your complaint to the manager:",
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                sizedBox40(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: myTextFieldName(
                      minLines: 5,
                      maxLines: 12,
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 81, 79, 79)),
                      nameText: " Explain your complaint",
                      nameController: complient,
                      readOnly: false),
                ),
                sizedBox40(),
                MyButton(
                    title: "submit",
                    onpress: () async {
                      var temp = await ComplainttoadminImpl()
                          .sendComplaint(complient.text);
                      if (temp == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(
                                'Thanks for participating in the improvement of the application')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Sorry, try again latter')));
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
      ),
    ));
  }
}
