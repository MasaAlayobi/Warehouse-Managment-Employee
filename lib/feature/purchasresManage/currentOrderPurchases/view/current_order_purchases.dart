import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/status.dart';
import 'package:mobile_warehouse_managment/core/domain/purchase_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/bloc/customers_bloc.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/currentOrderPurchases/addOrderView/addOrderPurchase.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/currentOrderPurchases/bloc/purchase_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/purchasresManage/purchaseCurrentOrderDetails/view/purchases_order_details.dart';

class CurrentOrderPurchases extends StatelessWidget {
  CurrentOrderPurchases({super.key});

  // List<String> items = ["sending", "recieved"];
  @override
  Widget build(BuildContext context) {
    String? status;
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddOrderPurchaseView(),
          ));
        },
        child: Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              color: AppColor.purple4, borderRadius: BorderRadius.circular(12)),
          child: const Center(
            child: Icon(
              Icons.add,
              color: AppColor.white,
              size: 33,
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.purple1,
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Current Order',
      ),
      body: BlocProvider(
        create: (context) => PurchaseOrderBloc(),
        child: Builder(builder: (context) {
          context.read<PurchaseOrderBloc>().add(GetPurchaseOrderEvent());
          return SingleChildScrollView(
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
                      return SizedBox(
                          child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.listWarehouseInState.length,
                              itemBuilder: (context, index) {
                                status =
                                    state.listWarehouseInState[index].status!;
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          PurchasesOrderDetails(
                                              id: state
                                                  .listWarehouseInState[index]
                                                  .id),
                                    ));
                                  },
                                  child: Card(
                                    elevation: 5,
                                    color: AppColor.white,
                                    child: Container(
                                        // height: 130,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColor.white),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  width: 90,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
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
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.7,
                                                    child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          "No${state.listWarehouseInState[index].id.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                        ))),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.7,
                                                    child: FittedBox(
                                                        fit: BoxFit.contain,
                                                        child: Text(
                                                          'Supplier : ${state.listWarehouseInState[index].supplier!.name}',
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ))),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.7,
                                                    child: Text(
                                                      'Total : ${state.listWarehouseInState[index].order!.price.toString()} ',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )),
                                                StatefulBuilder(builder:
                                                    (context, setState) {
                                                  // setState(() {});
                                                  return DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: AppColor.purple1,
                                                        border: Border.all(
                                                            color: AppColor
                                                                .purple4,
                                                            width: 2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9)),
                                                    child: SizedBox(
                                                      height: 33,
                                                      child: DropdownButton<
                                                              String>(
                                                          hint: Center(
                                                            child: Text(
                                                              state
                                                                  .listWarehouseInState[
                                                                      index]
                                                                  .status
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_downward,
                                                            size: 22,
                                                          ),
                                                          iconDisabledColor:
                                                              AppColor.purple4,
                                                          iconEnabledColor:
                                                              AppColor.purple4,
                                                          underline:
                                                              Container(),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          itemHeight: 70,
                                                          // value: state
                                                          //     .listWarehouseInState[
                                                          //         index]
                                                          //     .status,
                                                          items: [
                                                            DropdownMenuItem<
                                                                String>(
                                                              child: HeaderText(
                                                                  text:
                                                                      "sending",
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              value: "sending",
                                                            ),
                                                            DropdownMenuItem<
                                                                String>(
                                                              child: HeaderText(
                                                                  text:
                                                                      "recieved",
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                              value: "recieved",
                                                            ),
                                                          ],
                                                          onChanged: (item) {
                                                            showModalBottomSheet(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return Builder(
                                                                      builder:
                                                                          (context) {
                                                                    return Container(
                                                                      height:
                                                                          MediaQuery.of(context).size.height /
                                                                              5,
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: <Widget>[
                                                                            HeaderText(
                                                                                fontSize: 22,
                                                                                fontWeight: FontWeight.w600,
                                                                                text: "are you sure?"),
                                                                            sizedBox15(),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                MyButton(
                                                                                    title: "accept",
                                                                                    onpress: () async {
                                                                                      try {
                                                                                        var response = await purchaseServiceImpl().changeStatus(state.listWarehouseInState[index].id, StatusModel(status: status!));
                                                                                        print(response);
                                                                                        print("1111111111111111111111111");

                                                                                        if (response == "Order status has been updated successfully") {
                                                                                          setState(() {
                                                                                            status = item!;
                                                                                          });
                                                                                          GoRouter.of(context).pop();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), backgroundColor: AppColor.green2, content: SizedBox(height: 50, child: Center(child: SubTitle3(text: response.toString())))));
                                                                                        } else {
                                                                                          print(response);
                                                                                          GoRouter.of(context).pop();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), backgroundColor: AppColor.red, content: SizedBox(height: 50, child: Center(child: SubTitle3(text: response.toString())))));
                                                                                        }
                                                                                      } catch (e) {
                                                                                        print(e);
                                                                                        GoRouter.of(context).pop();
                                                                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 3), backgroundColor: AppColor.red, content: SizedBox(height: 50, child: Center(child: SubTitle3(text: e.toString())))));
                                                                                      }
                                                                                    },
                                                                                    colors: AppColor.green2,
                                                                                    width: MediaQuery.of(context).size.width / 3,
                                                                                    height: 44,
                                                                                    radius: 9),
                                                                                MyButton(
                                                                                    title: "cancel",
                                                                                    onpress: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    colors: AppColor.red,
                                                                                    width: MediaQuery.of(context).size.width / 3,
                                                                                    height: 44,
                                                                                    radius: 9),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                                });
                                                          }),
                                                    ),
                                                  );
                                                })
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
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
