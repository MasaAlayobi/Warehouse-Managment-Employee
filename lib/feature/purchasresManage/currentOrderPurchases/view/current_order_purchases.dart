import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class CurrentOrderPurchases extends StatelessWidget {
  const CurrentOrderPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Current Order',
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text('  current Order : ',
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: AppColor.black)),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                         GoRouter.of(context).push(AppRouter.kPurchasesOrderDetails);
                      },
                      child: Card(
                        elevation: 5,
                        color: AppColor.white,
                        child: Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.white),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      width: 90,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: AppColor.purple5),
                                      child: Image.asset(
                                          'assets/images/previousPurchas.png')),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.7,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              '#505EE0',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w800),
                                            ))),
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.7,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Supplier : Ahmad mohsin',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.7,
                                        child: Text(
                                          'Total : 4500\$ ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.7,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Order Status: Received',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.7,
                                        child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: Text(
                                              'Manager acceptance: Yes',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ))),
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}