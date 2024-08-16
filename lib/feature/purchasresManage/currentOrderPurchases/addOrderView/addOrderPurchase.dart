import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/config/widget/oneNestedExpansionTile.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/addOrder.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/domain/purchase_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/bloc/customers_bloc.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/bloc/add_product_to_inventory_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/bloc/add_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_Item_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_customer_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_warehouse_widget.dart';

class AddOrderPurchaseView extends StatefulWidget {
  const AddOrderPurchaseView({super.key});

  @override
  State<AddOrderPurchaseView> createState() => _AddOrderPurchaseViewState();
}

class _AddOrderPurchaseViewState extends State<AddOrderPurchaseView> {
  num? customerId1 = 1;
  int? selctedCustomer;
  String? customer;
  void updateCustomerId1(num customerId) {
    setState(() {
      customerId1 = customerId;
    });
  }

  List<Map> chooseItems = [];
  void updateData(List<Map> chooseItems1) {
    setState(() {
      chooseItems = chooseItems1;
    });
  }

  num? warehouseId1;
  void updateWarehouseId(num warehouseId) {
    setState(() {
      warehouseId1 = warehouseId;
    });
  }

  List<WarehouseproductModel> items = [];
  void updateWarehouseItem(List<WarehouseproductModel> Items) {
    setState(() {
      items = Items;
    });
  }

  bool _isExpanded = false;
  void _handleTap() {
    setState(() {
      _isExpanded = false;
    });
  }

  bool isCheckedCheckBox2 = false;
  String? selectedTitle;
  @override
  void initState() {
    super.initState();
    selectedTitle = '  Payment type'; // تعيين القيمة الابتدائية للعنوان
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomersBloc(),
      child: Builder(builder: (context) {
        context.read<CustomersBloc>().add(getCustomers());
        return Scaffold(
            drawer: CustomDrawer(),
            backgroundColor: AppColor.purple1,
            appBar: CustomAppbar(
              ispop: true,
              isnNotification: false,
              title: "Add Order",
            ),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: AppColor.red,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.red)),
                          child: Center(
                            child: HeaderText(
                              text: 'Please enter in order  :',
                              fontSize: 16,
                              textcolor: AppColor.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    HeaderText(
                      text: '   Choose customer  :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myNestedExpansionTile(
                          text1: " ${customer == null ? "customer" : customer}",
                          children: [
                            BlocBuilder<CustomersBloc, CustomersState>(
                              builder: (context, state) {
                                if (state is SuccessGetCustomers) {
                                  return ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            color: AppColor.purple3,
                                            endIndent: 22,
                                            indent: 22,
                                          ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: state.customersList.length,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              setState(() {
                                                selctedCustomer = state
                                                    .customersList[index].id;
                                              });
                                              setState(() {
                                                customer = state
                                                    .customersList[index].name;
                                              });
                                              print(selctedCustomer);
                                            },
                                            child: ListTile(
                                              title: Text(
                                                '${state.customersList[index].name}',
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              subtitle: Text(
                                                "${state.customersList[index].email}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ));
                                } else if (state is EmptyGetCustomers) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        Lottie.asset("assets/lottie/empty.json",
                                            width: 200, height: 333),
                                        Text("Empty"),
                                      ],
                                    ),
                                  );
                                } else if (state is LoadedGetCustomers) {
                                  return Center(
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                            "assets/lottie/loading.json",
                                            width: 200,
                                            height: 333),
                                        Text("Loading..."),
                                      ],
                                    ),
                                  );
                                }
                                return Text("try again latter");
                              },
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText(
                      text: '   Choose warehouse  :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ChooseWarehouseWidget(
                          itemsInWarehouse: updateWarehouseItem,
                          id: customerId1!,
                          onDataChanged: updateWarehouseId,
                          // variable: true,
                          widget: Text(""),
                          text1: "Warehouse",
                          // text2: "دمشق",
                          // text3: "ركن الدين",
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText(
                      text: '   Choose Payment type :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ExpansionTile(
                        initiallyExpanded: _isExpanded,
                        onExpansionChanged: (value) {
                          setState(() {
                            _isExpanded = value;
                            // variable=_isExpanded;
                          });
                          print(_isExpanded);
                          //   if(variable == false){
                          // //   context.read<RegisterBloc>().add(getCities());
                          // // controller.collapse();
                          //   }
                          // print(variable);
                        },
                        title: Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: AppColor.purple3,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              selectedTitle!,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.grey[200],
                        collapsedShape: ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        shape: ContinuousRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        collapsedBackgroundColor: Colors.grey[200],
                        textColor: AppColor.black,
                        iconColor: AppColor.black,
                        children: [
                          ListView.separated(
                            itemCount: 1,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                //  someFunctionThatChangesData(state.customersList[index].id);
                                //  _handleTap();
                                setState(() {
                                  //  variabl==false;
                                  print(_isExpanded);
                                  // تحديث الحالة بالقيمة الجديدة
                                  selectedTitle = 'cash';
                                });
                                return ExpansionTileController.of(context)
                                    .collapse();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 33, vertical: 11),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        child: HeaderText(
                                          text: "Cash",
                                          fontSize: 16,
                                          textcolor: AppColor.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    // widget.widget
                                  ],
                                ),
                              ),
                            ),
                            separatorBuilder: (context, index) => Divider(
                              indent: 22,
                              endIndent: 22,
                            ),
                          )
                          // ],
                          // ),
                          //   ),
                          //   separatorBuilder: (context, index) => Divider(
                          //     indent: 22,
                          //     endIndent: 22,
                          //   ),
                          // );
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HeaderText(
                      text: '   Choose items :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () {
                            // context
                            //     .read<RegisterBloc>()
                            //     .add(getCities());
                          },
                          child: ChooseItemWidget(
                              items: items,
                              onDataChanged: updateData,
                              text1: "Items",
                              widget: Text(""),
                            
                              variable: isCheckedCheckBox2),
                        )),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: myButtonWithBorder(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2.8,
                          fillColor: AppColor.blue2,
                          onTap: () async {
                            AddOrderPurchaseModel order = AddOrderPurchaseModel(
                                supplier_id: customerId1!.toInt(),
                                warehouse_id: warehouseId1!.toInt(),
                                payment_type: selectedTitle!,
                                items: chooseItems);
                            var response = await purchaseServiceImpl()
                                .addOrderPurchase(order);
                            print(order);
                            try {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: AppColor.green2,
                                      content: SizedBox(
                                          height: 50,
                                          child: Center(
                                              child: SubTitle3(
                                                  text:
                                                      response.toString())))));
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration: Duration(seconds: 3),
                                      backgroundColor: AppColor.red,
                                      content: SizedBox(
                                          height: 50,
                                          child: Center(
                                              child: SubTitle3(
                                                  text: e.toString())))));
                            }
                          },
                          border: Border.all(color: AppColor.blue1),
                          radius: 12,
                          text: "Add",
                          textColor: AppColor.black,
                          fontsize: 17,
                          // width:
                          //     MediaQuery.of(context).size.width / 2.8,
                          fontWeight: FontWeight.w700),
                    ),
                  ]),
            ));
      }),
    );
  }
}
