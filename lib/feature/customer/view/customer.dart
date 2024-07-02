import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/detailsCustomer.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/detailSupplier.dart';

import '../../../core/config/widget/custom_drawer.dart';

class Customer extends StatelessWidget {
  const Customer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColor.purple1,
      appBar: CustomAppbar(
        isBackarrow: false,
        isnNotification: true,
        title: "Customer",
      ),
      body: Column(
        children: [
          HeaderText(
            text: "All customers:",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            textcolor: AppColor.black,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailCustomer(),
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                      child: Card(
                        color: AppColor.white,
                        elevation: 13,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.height / 9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: AppColor.white),
                                child: Image.asset(
                                  'assets/images/img.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Dania Bakoura',
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "Debts",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Date of debt:2009/9/9",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Date of pay:2009/9/5",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
