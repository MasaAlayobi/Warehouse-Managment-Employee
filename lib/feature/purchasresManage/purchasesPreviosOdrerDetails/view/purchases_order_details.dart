import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/detailsClient/bloc/detail_of_client_bloc.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/currentOrderPurchases/bloc/purchase_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/purchaseCurrentOrderDetails/bloc/details_of_order_puchase_bloc.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/purchasesPreviosOdrerDetails/bloc/details_of_order_puchase_bloc.dart';

class PurchasesOrderDetails extends StatelessWidget {
  const PurchasesOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Order details',
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) =>
              DetailsOfOrderPuchaseBloc()..add(GetDetailsPurchaseOrder(id: 1)),
          child: Builder(builder: (context) {
            return BlocBuilder<DetailsOfOrderPuchaseBloc,
                DetailsOfOrderPuchaseState>(
              builder: (context, state) {
                if (state is SuccessGetPurchase) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            color: AppColor.purple4),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 150,
                                  width: 100,
                                  child: Image.asset('assets/images/img.png'),
                                ),
                                SizedBox(
                                  width: 10,
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
                                              1.8,
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                'Supplier : Ahmad mohsin',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white),
                                              ))),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                'Order No : 505EE0 ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white),
                                              ))),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                'Total  : 149999.99\$',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white),
                                              ))),
                                      // Container(
                                      //     width: MediaQuery.of(context).size.width / 1.8,
                                      //     child: FittedBox(
                                      //         fit: BoxFit.contain,
                                      //         child: Text(
                                      //           'Manager acceptance: Yes',
                                      //           style: TextStyle(
                                      //               fontSize: 14,
                                      //               fontWeight: FontWeight.w500,
                                      //                color: AppColor.white),
                                      //         ))),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                'Payment status : cash',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.white),
                                              ))),
                                    ])
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Manager acceptance: Yes',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white),
                                    ))),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Order date : 2004 / 1 / 1 ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.white),
                                    ))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('  Ordre Product :',
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 11,
                                    crossAxisSpacing: 2,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.56),
                            itemCount: 11,
                            itemBuilder: (context, index) {
                              return Card(
                                  elevation: 11,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            "assets/images/Rectangle (4).png",
                                            fit: BoxFit.fill,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                5,
                                            // width: MediaQuery.of(context).size.width / 1.1,
                                          ),
                                        ),
                                        Divider(
                                            color: const Color.fromARGB(
                                                255, 1, 206, 83)),
                                        Align(
                                          alignment: Alignment.center,
                                          child: HeaderText(
                                              text: "ADIDAS",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: HeaderText(
                                              text: "quality: 30",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: HeaderText(
                                              text: "price: 1000\$",
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        sizedBox40(),
                                      ],
                                    ),
                                  ));
                            },
                          ),
                        ),
                      )
                    ],
                  );
                } else if (state is LoadedGetDetailsPurchase) {
                  return Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/lottie/loading.json",
                            width: 200, height: 333),
                        Text("Loading..."),
                      ],
                    ),
                  );
                } else {
                  Center(
                    child: Text("No Connection"),
                  );
                }
                return Text("try again latter");
              },
            );
          }),
        ),
      ),
    );
  }
}
