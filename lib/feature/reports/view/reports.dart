import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/config/widget/nestedExpansionTile.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

import '../../../core/config/widget/custom_drawer.dart';

class Reports extends StatelessWidget {
  Reports({super.key});
  TextEditingController firstDate = TextEditingController();
  TextEditingController lastDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        backgroundColor: AppColor.purple1,
        appBar: CustomAppbar(
          ispop: false,
          isnNotification: false,
          title: "Create reports",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText(
                    text: "Create a new report:",
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
                const sizedBox50(),
                HeaderText(
                    text: "Specify the start date of the report :",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                const sizedBox50(),
                StatefulBuilder(builder: (context, setState) {
                  return myTextFieldDate(
                      suffixIcon: InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2025));
                            if (date == null) {
                              return;
                            }
                            setState(
                              () {
                                firstDate.text =
                                    "${date.year}/${date.month}/${date.day}";
                              },
                            );
                          },
                          child: Icon(Icons.date_range)),
                      hintName: "YY/MM/DD",
                      hintStyle: TextStyle(color: AppColor.grey1),
                      fillColor: AppColor.white,
                      circular: 25,
                      nameController: firstDate,
                      readOnly: false);
                }),
                const sizedBox50(),
                HeaderText(
                    text: "Specify the end date of the report :",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                const sizedBox50(),
                StatefulBuilder(builder: (context, setState) {
                  return myTextFieldDate(
                      suffixIcon: InkWell(
                          onTap: () async {
                            DateTime? date = await showDatePicker(
                                context: context,
                                firstDate: DateTime(1990),
                                lastDate: DateTime(2025));
                            if (date == null) {
                              return;
                            }
                            setState(
                              () {
                                lastDate.text =
                                    "${date.year}/${date.month}/${date.day}";
                              },
                            );
                          },
                          child: Icon(Icons.date_range)),
                      hintName: "YY/MM/DD",
                      hintStyle: TextStyle(color: AppColor.grey1),
                      fillColor: AppColor.white,
                      circular: 25,
                      nameController: lastDate,
                      readOnly: false);
                }),
                const sizedBox50(),
                HeaderText(
                    text: "Specify the Type of report :",
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
                const sizedBox50(),
                TwoNestedExpansionTile(
                  sizeTextOfExpansionTile1: 17,
                  fillColorOfExpansionTile1: AppColor.white,
                  colorTextOfExpansionTile1: AppColor.grey1,
                  radius: 33,
                  fillColorOfChildrenExpanionTile2: AppColor.white,
                  colorTextOfExpansionTile2:
                      const Color.fromARGB(255, 111, 120, 131),
                  textOfExpansionTile1: "Type of report",
                  lengthOfExpansionTile2: 2,
                  sizeTextOfExpansionTile2: 15,
                  fillColorOfExpanionTile2: AppColor.white,
                ),
                const sizedBox15(),
                MyButton(
                    title: "Create a report",
                    onpress: () {},
                    colors: AppColor.purple3,
                    fontsize: 20,
                    width: MediaQuery.of(context).size.width / 1,
                    height: MediaQuery.of(context).size.height / 15,
                    radius: 25)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
