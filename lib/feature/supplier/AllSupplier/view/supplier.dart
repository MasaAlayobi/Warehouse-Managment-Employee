import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/addSupplier.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/detailSupplier.dart';

import '../../../../core/config/widget/custom_drawer.dart';

class Supplier extends StatelessWidget {
  const Supplier({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddDetailSupplier(),
          ));
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: AppColor.purple4, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Icon(
              Icons.person_add_alt_outlined,
              color: AppColor.white,
              size: 33,
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
      backgroundColor: AppColor.purple1,
      appBar: CustomAppbar(
        ispop: false,
        isnNotification: true,
        title: "Suppliers",
      ),
      body: Column(
        children: [
          HeaderText(
            text: "All suppliers:",
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
                      builder: (context) => DetailSupplier(),
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
                                width: MediaQuery.of(context).size.width / 4,
                                height: MediaQuery.of(context).size.height / 9,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: AppColor.white),
                                child: Image.asset('assets/images/img.png'),
                              ),
                            ),
                            // SizedBox(
                            //   width: MediaQuery.of(context).size.width / 30,
                            // ),
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
