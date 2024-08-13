import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/currentOrderPurchases/bloc/purchase_order_bloc.dart';

class CurrentOrderPurchases extends StatelessWidget {
  const CurrentOrderPurchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Current Order',
      ),
      body: BlocProvider(
        create: (context) => PurchaseOrderBloc()..add(GetPurchaseOrderEvent()),
        child: Column(
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
            BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
              builder: (context, state) {
                if (state is SuccessGetPurchase) {
                  return Expanded(
                      child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kPurchasesOrderDetails);
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
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      '#505EE0',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ))),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      'Supplier : Ahmad mohsin',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ))),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: Text(
                                                  'Total : 4500\$ ',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      'Order Status: Received',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ))),
                                            Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.7,
                                                child: FittedBox(
                                                    fit: BoxFit.contain,
                                                    child: Text(
                                                      'Manager acceptance: Yes',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ))),
                                          ],
                                        )
                                      ],
                                    )),
                              ),
                            );
                          }));
                } else if (state is EmptyGetPurchase) {
                  return Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/lottie/empty.json",
                            width: 200, height: 333),
                        Text("Empty"),
                      ],
                    ),
                  );
                } else if (state is LoadedGetPurchase) {
                  return Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/lottie/loading.json",
                            width: 200, height: 333),
                        Text("Loading..."),
                      ],
                    ),
                  );
                }
                return Text("try again latter");
              },
            )
          ],
        ),
      ),
    );
  }
}
