import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWidget.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/show_all_current_sale_order_model.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/bloc/all_current_sale_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/bloc/all_shipment_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/widget/ShowMBSInware.dart';

class WidgetNewOrder extends StatefulWidget {
  WidgetNewOrder({super.key, required this.order});
  final ShowAllCurrentSaleOrderModel order;

  @override
  State<WidgetNewOrder> createState() => _WidgetNewOrderState();
}

class _WidgetNewOrderState extends State<WidgetNewOrder> {
  bool isAllProduct = true;
  String status = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = 'preparation';
  }

  @override
  List<String> purchase = ['sending', 'received'];

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCurrentSaleOrderBloc(),
      child: Builder(builder: (context) {
        return BlocListener<AllCurrentSaleOrderBloc, AllCurrentSaleOrderState>(
          listener: (context, state) {
            if (state is SuccessChangeStatus) {
                                      print(';;;;;;;;;;;;');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: AppColor.green1,
                                      ));
                                          //                               Navigator.pop(
                                          // context);
                                      GoRouter.of(context).pushReplacement(
                                          AppRouter.kCurrentOrderView);
                                    } else if (state is NoConnectionWithChange) {
                                      print(';;;;;;;;;;;;');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: AppColor.red,
                                      ));
                                      // GoRouter.of(context).pushReplacement(
                                      //     AppRouter.kCurrentOrderView);
                                      // Navigator.pop(
                                      //     context);
                                    }
          },
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 8,
                  color: AppColor.white,
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.white),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColor.purple5),
                              child: Image.asset('assets/images/order.png')),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 2.0,
                                child: Text(
                                  'client : ${widget.order.client!.name}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Text(
                                  'Warehouse : ${widget.order.order!.warehouse.name} ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 2.0,
                                child: Text(
                                  'Total  : ${widget.order.order!.price}\$',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                                width: MediaQuery.of(context).size.width / 2.0,
                                child: Text(
                                  'shipment : ${widget.order.shipment == null ? 'Not added' : widget.order.shipment!.tracking_number}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                if (widget.order.shipment != null)
                                  Builder(builder: (context) {
                                    return Container(
                                      width: 180,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: AppColor.blue1),
                                        color: AppColor.blue2,
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          isDense: true,
                                          underline: null,
                                          iconEnabledColor: AppColor.blue1,
                                          iconDisabledColor: AppColor.blue1,
                                          focusColor: AppColor.blue2,
                                          dropdownColor: AppColor.blue2,
                                          hint: Container(
                                            child: Text(
                                              'Status : ${widget.order.status}',
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          onChanged: (value) {},
                                          isExpanded: false,
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: 'sending',
                                              child: const Text('sending'),
                                              onTap: () {
                                                setState(() {
                                                  status = 'sending';
                                                  isAllProduct = true;
                                                });
                                                context
                                                    .read<
                                                        AllCurrentSaleOrderBloc>()
                                                    .add(ChangeOrderStatus(
                                                        orderId:
                                                            widget.order.id,
                                                        status: status));
                                              },
                                            ),
                                            DropdownMenuItem<String>(
                                              value: 'received',
                                              child: const Text('received'),
                                              onTap: () {
                                                setState(() {
                                                  status = 'received';
                                                  isAllProduct = false;
                                                });
                                                context
                                                    .read<
                                                        AllCurrentSaleOrderBloc>()
                                                    .add(ChangeOrderStatus(
                                                        orderId:
                                                            widget.order.id,
                                                        status: status));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                if (widget.order.shipment == null)
                                  myButtonWithBorder(
                                      fillColor: AppColor.blue2,
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Builder(
                                                  builder: (context) {
                                                context
                                                    .read<AllShipmentBloc>()
                                                    .add(GetAllShipment());
                                                List<bool> isCheckedCheckBox2 =
                                                    [];
                                                return SingleChildScrollView(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: MediaQuery.of(
                                                                context)
                                                            .viewInsets
                                                            .bottom),
                                                    child: Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              1.5,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      33)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          HeaderText(
                                                            text:
                                                                '   Choose shipment :',
                                                            fontSize: 18,
                                                            textcolor: AppColor
                                                                .purple4,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                          ),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Divider(
                                                            thickness: 2,
                                                            color: AppColor
                                                                .purple4,
                                                          ),
                                                          BlocBuilder<
                                                              AllShipmentBloc,
                                                              AllShipmentState>(
                                                            builder: (context,
                                                                state) {
                                                              if (state
                                                                  is SuccessFetchAllShipment) {
                                                                return Expanded(
                                                                    child: ListView
                                                                        .builder(
                                                                  itemCount: state
                                                                      .allShipment
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    isCheckedCheckBox2
                                                                        .add(
                                                                            false);
                                                                    return Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal:
                                                                              33,
                                                                          vertical:
                                                                              11),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Container(
                                                                                  child: HeaderText(
                                                                                    text: '${state.allShipment[index].tracking_number}',
                                                                                    fontSize: 16,
                                                                                    textcolor: AppColor.black,
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  color: AppColor.grey3,
                                                                                  indent: 20,
                                                                                  endIndent: 20,
                                                                                ),
                                                                                Container(
                                                                                  child: HeaderText(
                                                                                    text: ' Current capacity : ${state.allShipment[index].current_capacity} %',
                                                                                    fontSize: 15,
                                                                                    textcolor: AppColor.purple4,
                                                                                    fontWeight: FontWeight.w400,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          BlocListener<
                                                                              AllCurrentSaleOrderBloc,
                                                                              AllCurrentSaleOrderState>(
                                                                            listener:
                                                                                (context, state) {
                                                                              if (state is SuccessAdd) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                                                  content: Text(state.message),
                                                                                  backgroundColor: AppColor.green1,
                                                                                ));
                                                                                GoRouter.of(context).pushReplacement(AppRouter.kCurrentOrderView);
                                                                              } else if (state is NotAdded) {
                                                                                ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                                                                  content: Text(state.message),
                                                                                  backgroundColor: AppColor.red,
                                                                                ));
                                                                                GoRouter.of(context).pushReplacement(AppRouter.kCurrentOrderView);
                                                                                // Navigator.pop(
                                                                                //     context);
                                                                              }
                                                                            },
                                                                            child:
                                                                                StatefulBuilder(builder: (context, setState) {
                                                                              return Checkbox(
                                                                                // checkColor: ,
                                                                                activeColor: isCheckedCheckBox2[index] == true ? AppColor.blue1 : null,
                                                                                value: isCheckedCheckBox2[index],
                                                                                onChanged: (bool? value) {
                                                                                  if (value == true) {
                                                                                    context.read<AllCurrentSaleOrderBloc>().add(AddOrderInShipment(orderId: widget.order.id, shipmentId: state.allShipment[index].id));
                                                                                  }
                                                                                  print('-------------------------');
                                                                                  print(value);
                                                                                  setState(() {
                                                                                    isCheckedCheckBox2 = isCheckedCheckBox2.map((_) => false).toList();
                                                                                    isCheckedCheckBox2[index] = value!;
                                                                                    print(isCheckedCheckBox2);
                                                                                    // isCheckedCheckBox2=
                                                                                  });
                                                                                },
                                                                              );
                                                                            }),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                ));
                                                              } else if (state
                                                                  is NoConnectionWithAllShipment) {
                                                                return RefreshIndicator(
                                                                  onRefresh:
                                                                      () async {
                                                                    print(
                                                                        "object");
                                                                    context
                                                                        .read<
                                                                            AllShipmentBloc>()
                                                                        .add(
                                                                            GetAllShipment());
                                                                  },
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Lottie.asset(
                                                                            "assets/lottie/empty.json",
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                333),
                                                                        Text(state
                                                                            .message),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                return RefreshIndicator(
                                                                  onRefresh:
                                                                      () async {
                                                                    context
                                                                        .read<
                                                                            AllShipmentBloc>()
                                                                        .add(
                                                                            GetAllShipment());
                                                                  },
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        Lottie.asset(
                                                                            "assets/lottie/loading.json",
                                                                            width:
                                                                                200,
                                                                            height:
                                                                                333),
                                                                        Text(
                                                                            "Loading..."),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                            });
                                      },
                                      border: Border.all(color: AppColor.blue1),
                                      radius: 12,
                                      text: "add to shipment",
                                      textColor: AppColor.black,
                                      fontsize: 14,
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
                                      fontWeight: FontWeight.w400),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ))),
        );
      }),
    );
  }
}
