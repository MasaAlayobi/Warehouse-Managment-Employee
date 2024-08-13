import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/bloc/add_product_to_inventory_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/bloc/add_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_Item_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_customer_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/widget/choose_warehouse_widget.dart';

class AddOrderSaleView extends StatefulWidget {
  const AddOrderSaleView({super.key});

  @override
  State<AddOrderSaleView> createState() => _AddOrderSaleViewState();
}

class _AddOrderSaleViewState extends State<AddOrderSaleView> {
  num? customerId1 = 1;
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
  List<WarehouseproductModel> items=[];
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
      create: (context) => AddOrderBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
              drawer: CustomDrawer(),
              backgroundColor: AppColor.purple1,
              appBar: CustomAppbar(
                ispop: false,
                isnNotification: false,
                title: "Add Order",
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
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
                          decoration:
                              BoxDecoration(border: Border.all(color: AppColor.red)),
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
                      height: 20,
                    ),
                    HeaderText(
                      text: '   Choose customer  :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    //  SizedBox(height: 30,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ChooseCustomerWidget(
                          onDataChanged: updateCustomerId1,
                          // variable: true,
                          widget: Text(""),
                          text1: " customer :",
                          // text2: "دمشق",
                          // text3: "ركن الدين",
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    HeaderText(
                      text: '   Choose warehouse  :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
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
                      height: 10,
                    ),
                    HeaderText(
                      text: '   Choose Payment type :',
                      fontSize: 16,
                      textcolor: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
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
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20))),
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
                                return ExpansionTileController.of(context).collapse();
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 33, vertical: 11),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: 10,
                ),
                HeaderText(
                  text: '   Choose items :',
                  fontSize: 16,
                  textcolor: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 10,
                ),
                 Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 12),
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
                                          // widget: StatefulBuilder(
                                          //   builder: (context, setState) => Checkbox(
                                          //     activeColor: ColorManager().red,
                                          //     value: isCheckedCheckBox2,
                                          //     onChanged: (bool? value) {
                                          //       setState(() {
                                          //         isCheckedCheckBox2 = value!;
                                          //       });
                                          //     },
                                          //   ),
          
                                          // text2: "دمشق",
                                          // text3: "ركن الدين",
                                          variable: isCheckedCheckBox2),
                                    )),
                                    BlocListener<AddOrderBloc, AddOrderState>(
                      listener: (context, state) {
                        if (state is SuccessAddSaleOrder) {
                              GoRouter.of(context).pushReplacement(
                                          AppRouter.kCurrentOrderView);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: AppColor.blue1,
                                      ));
                        }
                        else if(state is NoConnectionWithAdd){
                          ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(
                                          state.message 
                                        ),
                                        backgroundColor: AppColor.red,
                                      ));
                        }
                      },
                      child: MyButton(
                          title: 'Add',
                          textcolor: AppColor.black,
                          fontsize: 20,
                          onpress: () {
                         AddSaleOrderModel order =   AddSaleOrderModel(client_id:customerId1!.toInt() , warehouse_id: warehouseId1!.toInt(), payment_type: selectedTitle!, items: chooseItems);
                              context.read<AddOrderBloc>().add(AddSaleOrder(order: order));
                          },
                          colors: AppColor.blue1,
                          width: 150,
                          height: 50,
                          radius: 20),
                    ),
                
              
            ]),
          ));
        }
      ),
    );
  }
}
