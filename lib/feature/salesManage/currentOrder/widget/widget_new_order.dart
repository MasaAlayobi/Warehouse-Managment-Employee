import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWidget.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/show_all_current_sale_order_model.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
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
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            // return ExpansionTileController.of(context).collapse();
          },
          child: Card(
              elevation: 8,
              color: AppColor.white,
              child: Container(
                height: 140,
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
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            child: Text(
                              'Warehouse : ${widget.order.order!.warehouse.name} ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.0,
                            child: Text(
                              'Total  : ${widget.order.order!.price}\$',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.0,
                            child: Text(
                              'shipment : ${widget.order.shipment == null ? 'Not added' : widget.order.shipment}',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (widget.order.shipment != null)
                              Container(
                                width: 180,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: AppColor.blue1),
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
                                        'Status : ${status}',
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
                                          // context.read<ProductsInWareBloc>().add(
                                          //     GetAllProductsInWare(
                                          //         id: state
                                          //             .listProductInWareInState.id));
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
                                          // context.read<ProductsInWareBloc>().add(
                                          //     GetAllProductsInWare(
                                          //         id: state
                                          //             .listProductInWareInState.id));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (widget.order.shipment == null)
                              myButtonWithBorder(
                                  fillColor: AppColor.blue2,
                                  onTap: () {
                                     showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                    return  SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
           height: MediaQuery.of(context).size.height / 1.5,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(33)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(child: ListView.builder(
                itemCount: 14,
                itemBuilder:(context, index) {
                  return null;

                },)
            )
            ],
          ),
        ),
      ),
    );
                                    });
                                  },
                                  border: Border.all(color: AppColor.blue1),
                                  radius: 12,
                                  text: "add to shipment",
                                  textColor: AppColor.black,
                                  fontsize: 14,
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  fontWeight: FontWeight.w400),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ));
  }
}
