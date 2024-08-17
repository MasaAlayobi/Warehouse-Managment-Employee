import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/dateReport.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/bloc/all_current_sale_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/orderDitails/view/order_sale_details.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/widget/widget_new_order.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/config/function/saveFun.dart';

class CurrentOrderView extends StatelessWidget {
  CurrentOrderView({super.key});
  TextEditingController sDate = TextEditingController();
  TextEditingController lDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCurrentSaleOrderBloc(),
      child: Builder(builder: (context) {
        context.read<AllCurrentSaleOrderBloc>().add(GetAllCurrentSaleOrder());
        return Scaffold(
          backgroundColor: AppColor.purple1,
          drawer: CustomDrawer(),
          appBar: CustomAppbar(
            isnNotification: false,
            ispop: true,
            title: 'New orders',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('    Orders :',
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      color: AppColor.black)),
              SizedBox(
                height: 10,
              ),
              Expanded(child: BlocBuilder<AllCurrentSaleOrderBloc,
                  AllCurrentSaleOrderState>(
                builder: (context, state) {
                  if (state is SuccessfetchOrder) {
                    print('99999999999999999999999');
                    return ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  print('object');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderSaleDetails(
                                            id: state.orders[index].id),
                                      ));
                                },
                                child: Dismissible(
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    height: 40,
                                    color: AppColor.red,
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColor.white,
                                      size: 40,
                                    ),
                                  ),
                                  key: Key(state.orders[index].toString()),
                                  confirmDismiss: (direction) async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text("Confirm Deletion"),
                                        content: Text(
                                            "Are you sure you want to delete this item?"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () async {
                                              var response =
                                                  await SalesManageServiceImp()
                                                      .deleteOrder(state
                                                          .orders[index].id);
                                              if (response == true) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(new SnackBar(
                                                  content:
                                                      Text("success to delete"),
                                                  backgroundColor:
                                                      AppColor.green2,
                                                ));
                                                GoRouter.of(context).push(
                                                    AppRouter
                                                        .kCurrentOrderView);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(new SnackBar(
                                                  content:
                                                      Text("failed to delete "),
                                                  backgroundColor: AppColor.red,
                                                ));
                                              }
                                            },
                                            child: Text("Delete"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(false);
                                            },
                                            child: Text("Cancel"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: WidgetNewOrder(
                                    order: state.orders[index],
                                  ),
                                )),
                            if (index == state.orders.length - 1)
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 22, bottom: 22),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: TextButton(
                                    onPressed: () async {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (BuildContext context) {
                                            return Builder(builder: (context) {
                                              return SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: AppColor.purple1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(19)),
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            2,
                                                    child: Center(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          HeaderText(
                                                              fontSize: 22,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              text:
                                                                  "enter first and end date:"),
                                                          sizedBox30(),
                                                          StatefulBuilder(
                                                              builder: (context,
                                                                  setState) {
                                                            return Column(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          22.0),
                                                                  child: myTextFieldDate(
                                                                      suffixIcon: InkWell(
                                                                          onTap: () async {
                                                                            DateTime?
                                                                                date =
                                                                                await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(2025));
                                                                            if (date ==
                                                                                null) {
                                                                              return;
                                                                            }
                                                                            setState(
                                                                              () {
                                                                                sDate.text = "${date.year}/${date.month}/${date.day}";
                                                                              },
                                                                            );
                                                                          },
                                                                          child: Icon(Icons.date_range)),
                                                                      hintName: "start date",
                                                                      hintStyle: TextStyle(color: AppColor.grey1),
                                                                      fillColor: AppColor.white,
                                                                      circular: 25,
                                                                      nameController: sDate,
                                                                      readOnly: false),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          22.0),
                                                                  child: myTextFieldDate(
                                                                      suffixIcon: InkWell(
                                                                          onTap: () async {
                                                                            DateTime?
                                                                                date =
                                                                                await showDatePicker(context: context, firstDate: DateTime(1990), lastDate: DateTime(2025));
                                                                            if (date ==
                                                                                null) {
                                                                              return;
                                                                            }
                                                                            setState(
                                                                              () {
                                                                                lDate.text = "${date.year}/${date.month}/${date.day}";
                                                                              },
                                                                            );
                                                                          },
                                                                          child: Icon(Icons.date_range)),
                                                                      hintName: "last date",
                                                                      hintStyle: TextStyle(color: AppColor.grey1),
                                                                      fillColor: AppColor.white,
                                                                      circular: 25,
                                                                      nameController: lDate,
                                                                      readOnly: false),
                                                                ),
                                                              ],
                                                            );
                                                          }),
                                                          sizedBox30(),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              MyButton(
                                                                  title:
                                                                      "accept",
                                                                  onpress:
                                                                      () async {
                                                                    // Request storage permission
                                                                    if (await Permission
                                                                        .manageExternalStorage
                                                                        .request()
                                                                        .isGranted) {
                                                                      var response = await SalesManageServiceImp().createReportSales(DateReportModel(
                                                                          toDate: lDate
                                                                              .text,
                                                                          fromDate:
                                                                              sDate.text));

                                                                      print(
                                                                          response);
                                                                      if (response !=
                                                                          "false") {
                                                                        saveFile(
                                                                            response,
                                                                            "sales_report.pdf");
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            duration:
                                                                                Duration(seconds: 22),
                                                                            backgroundColor:
                                                                                AppColor.green2,
                                                                            content:
                                                                                SizedBox(
                                                                              height: 50,
                                                                              child: Center(
                                                                                child: SubTitle3(text: "installed successfully"),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    } else {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                                          duration: Duration(seconds: 3),
                                                                          backgroundColor: AppColor.red,
                                                                          content: SizedBox(
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                Center(child: SubTitle3(text: "refuse give a permission successfully")),
                                                                          )));
                                                                      print(
                                                                          "Storage permission denied");
                                                                    }
                                                                  },
                                                                  colors: AppColor
                                                                      .green2,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  height: 44,
                                                                  radius: 9),
                                                              MyButton(
                                                                  title:
                                                                      "cancel",
                                                                  onpress: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  colors:
                                                                      AppColor
                                                                          .red,
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width /
                                                                      3,
                                                                  height: 44,
                                                                  radius: 9),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          });
                                    },
                                    child: Text(
                                      "create a report",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.purple4,
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2,
                                          decorationColor: AppColor.purple4),
                                    ),
                                  ),
                                ),
                              )
                          ],
                        );
                      },
                    );
                  } else if (state is NoConnection) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        print("object");
                        context
                            .read<AllCurrentSaleOrderBloc>()
                            .add(GetAllCurrentSaleOrder());
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
                        context
                            .read<AllCurrentSaleOrderBloc>()
                            .add(GetAllCurrentSaleOrder());
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
              ))
            ],
          ),
          floatingActionButton: Align(
            alignment: Alignment(0.9, 0.97),
            child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                  size: 35,
                ),
                backgroundColor: AppColor.purple4,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kAddOrderSaleView);
                }),
          ),
        );
      }),
    );
  }
}
