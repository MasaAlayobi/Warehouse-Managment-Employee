import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/bloc/add_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/productOfWareWithDetails/bloc/products_in_ware_bloc.dart';

class ChooseWarehouseWidget extends StatefulWidget {
  String text1;
  final num id;
  // String text2;
  // String text3;
  // bool? variable=true;
  final Function(num) onDataChanged;
  final Function(List<WarehouseproductModel>) itemsInWarehouse;
  Widget widget;
  ChooseWarehouseWidget({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    // this.variable,
    required this.widget,
    required this.onDataChanged, required this.id, required this.itemsInWarehouse,
  }) : super(key: key);

  @override
  State<ChooseWarehouseWidget> createState() => _ChooseWarehouseWidgetState();
}

class _ChooseWarehouseWidgetState extends State<ChooseWarehouseWidget> {
  List citiesId = [];
  String? selectedTitle;
  ExpansionTileController controller = ExpansionTileController();

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.text1; // تعيين القيمة الابتدائية للعنوان
  }
  // num? citieId;
  void someFunctionThatChangesData(num citieId) {
    widget.onDataChanged(citieId);
  }
  void ItemsInWarehouse(List<WarehouseproductModel> items) {
    widget.itemsInWarehouse(items);
  }
bool _isExpanded = false;
 void _handleTap() {
    setState(() {
      _isExpanded = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => AddOrderBloc()
      // ..add(getCities())
      ,
      child: Builder(
        
        builder: (context) {
          context.read<AddOrderBloc>().add(GetWarehousefromNeartoFar(id: widget.id.toInt()));
          return ExpansionTile(
            
            initiallyExpanded: _isExpanded,
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded=value;
                // variable=_isExpanded;
              });
              print(_isExpanded);
              //   if(variable == false){
              // //   context.read<RegisterBloc>().add(getCities());
              // // controller.collapse();
              //   }
              // print(variable);
            },
            title:  Row(
              children: [
                Icon(Icons.warehouse,color: AppColor.purple3,),
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
            collapsedBackgroundColor:Colors.grey[200],
            textColor: AppColor.black,
            iconColor: AppColor.purple3,
            children: [
              BlocBuilder<AddOrderBloc, AddOrderState>(
                builder: (context, state) {
                  if (state is SuccessFetchWarehouse) {
            //         return ListView.separated(
            //           shrinkWrap: true,
            //           itemCount: state.listWarehouseInState.length,
            //           physics: NeverScrollableScrollPhysics(),
            //           itemBuilder: (context, ind) => InkWell(
            //             onTap: () {
            //               // setState(() {
            //                 //  selectedTitle=state.Cities[ind].name;
            //                 // if (state.Cities[ind].childrens.isEmpty) {
            //                 //  someFunctionThatChangesData(state.Cities[ind].id);
            //                 //  _handleTap();
            //                 //   setState(() {
            //                 // //  variabl==false;
                             
            //                 //       // تحديث الحالة بالقيمة الجديدة
            //                 //       selectedTitle = state.Cities[ind].name;
            //                 //     });
                             
            //                 // }
            //                 print('dddddddddddddddddddddddddddddddddddddddddddd');
            //               // });
            //             },
            //             child: ExpansionTile(
            //               // controller: controller,
            //               initiallyExpanded: _isExpanded,
            // onExpansionChanged: (val) {
            //   setState(() {
            //     // variable=_isExpanded;
            //     _isExpanded=val;
            //   });
            //   print(_isExpanded);
            //   return ExpansionTileController.of(
            //                                               context)
            //                                           .collapse();
            //   //   if(variable == false){
            //   // //   context.read<RegisterBloc>().add(getCities());
            //   // // controller.collapse();
            //   //   }
            //   // print(variable);
            // },
            //               title: HeaderText(
            //                   text: state.listWarehouseInState[ind].name!,
            //                   fontSize: 16,
            //                   textcolor: AppColor.black,
            //                   fontWeight: FontWeight.w600),
            //               backgroundColor: Colors.grey[200],
            //               collapsedShape: ContinuousRectangleBorder(
            //                   borderRadius: BorderRadius.all(Radius.circular(20))),
            //               shape: ContinuousRectangleBorder(
            //                   borderRadius: BorderRadius.all(Radius.circular(20))),
            //               collapsedBackgroundColor: Colors.grey[200],
            //               textColor: AppColor.black,
            //               iconColor: AppColor.black,
            //               children: [
                         return   ListView.separated(
                              itemCount: state.item.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                 someFunctionThatChangesData(state.item[index].id);
                                 ItemsInWarehouse(state.item[index].items);
                                
                                 _handleTap();
                                  setState(() {
                                //  variabl==false;
                                 print(_isExpanded);
                                  // تحديث الحالة بالقيمة الجديدة
                                  selectedTitle = state.item[index].name;
          
                                });
                                 return ExpansionTileController.of(
                                                          context)
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
                                            text: state.item[index].name!
                                                ,
                                            fontSize: 16,
                                            textcolor: AppColor.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      widget.widget
                                    ],
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) => Divider(
                                indent: 22,
                                endIndent: 22,
                              ),
                            );
                          // ],
                        // ),
                    //   ),
                    //   separatorBuilder: (context, index) => Divider(
                    //     indent: 22,
                    //     endIndent: 22,
                    //   ),
                    // );
                  } else if (state is Loading) {
                    return Center(
                        child: Lottie.asset("assets/lottie/loading.json",
                              width: 200, height: 333));
                  // } else if (state is NoConnection) {
                  //   return Center(
                  //   child: Column(
                  //     children: [
                  //       Lottie.asset("assets/lottie/empty.json",
                  //           width: 200, height: 333),
                  //       Text("Empty")
                  //     ],
                  //   ),
                  // );
                  // } 
                  }else {
                    return Center(
                      child: Text('خطأ في الاتصال '),
                    );
                  }
                },
              )
            ],
          );
        }
      ),
    );
  }
}
