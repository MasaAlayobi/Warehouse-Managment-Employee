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
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/orderDitails/bloc/order_details_in_sale_bloc.dart';

class OrderSaleDetails extends StatelessWidget {
  const OrderSaleDetails({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsInSaleBloc(),
      child: Builder(
        builder: (context) {
          context.read<OrderDetailsInSaleBloc>().add(GetDetailsSaleOrder(id: id));
          return Scaffold(
            backgroundColor: AppColor.purple1,
            appBar: CustomAppbar(
              isnNotification: false,
              ispop: true,
              title: 'Order details',
            ),
            drawer: CustomDrawer(),
            body: SingleChildScrollView(
              child: BlocBuilder<OrderDetailsInSaleBloc,
                  OrderDetailsInSaleState>(
                builder: (context, state) {
                  if (state is SuccessFetchSaleOrderDetails) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.7,
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
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    1.8,
                                            child: Text(
                                              '${state.order.client!.name}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.white),
                                            )),
                                        Container(
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    1.8,
                                            child: Text(
                                              '${state.order.client!.location}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.white),
                                            )),
                                        Container(
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    1.8,
                                            child: Text(
                                              'Total price: ${state.order.order!.price}\nwarehouse name: ${state.order.order!.warehouse!.name}',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.white),
                                            )),
                                        if (state.order.order!
                                                .payment_at ==
                                            "depts")
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.8,
                                              child: FittedBox(
                                                  fit: BoxFit.contain,
                                                  child: Text(
                                                    'Order date : ${state.order.order!.payment_at} ',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColor.white),
                                                  ))),
                                      ])
                                ],
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width / 1.7,
                                  child: Text(
                                    'Payment status : ${state.order.status}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white),
                                  )),
                              Container(
                                  width: MediaQuery.of(context).size.width / 1.7,
                                  child: Text(
                                    'count of products : ${state.order.order!.items.length}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.white),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('  Ordre Products :',
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
                                      childAspectRatio: 0.5),
                              itemCount:
                                  state.order.order!.items.length,
                              itemBuilder: (context, index) {
                                var order = state.order.order;
                                return Card(
                                    elevation: 11,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
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
                                                    7,
                                                // width: MediaQuery.of(context).size.width / 1.1,
                                              ),
                                            ),
                                            Divider(
                                              // thickness: 22,
                                              color: AppColor.purple4,
                                            ),
                                            Align(
                                              alignment: Alignment.center,
                                              child: HeaderText(
                                                  text: order!
                                                      .items[index].item!.SKU
                                                      .toString(),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: HeaderText(
                                                  text:
                                                      "name: ${order!.items[index].item!.name.toString()}",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: HeaderText(
                                                  text:
                                                      "quantity: ${state.order.order!.items[index].quantity} ${state.order.order!.items[index].item!.unit} ",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: HeaderText(
                                                  text:
                                                      "price: ${order!.items[index].item!.pur_price.toString()}S.P",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: HeaderText(
                                                  text:
                                                      "weight: ${state.order.order!.items[index].item!.weight}\nsize m*m: ${state.order.order!.items[index].item!.weight}",
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            sizedBox40(),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  }  else if (state is NoConnection) {
              return RefreshIndicator(
                onRefresh: () async {
                  print("object");
                   context.read<OrderDetailsInSaleBloc>().add(GetDetailsSaleOrder(id: id));
                },
                child: Center(
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/empty.json",
                          width: 200, height: 333),
                      Text(state.message),
                    ],
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                   context.read<OrderDetailsInSaleBloc>().add(GetDetailsSaleOrder(id: id));
                },
                child: Center(
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/loading.json",
                          width: 200, height: 333),
                      Text("Loading..."),
                    ],
                  ),
                ),
              );
            }
                },
              ),
            ),
          );
        }
      ),
    );
  }
}
