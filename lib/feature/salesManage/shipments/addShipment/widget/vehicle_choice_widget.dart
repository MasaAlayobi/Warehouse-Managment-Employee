import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/productOfWareWithDetails/bloc/products_in_ware_bloc.dart';

class VehicleChoiceWidget extends StatefulWidget {
  String text1;
  final num id;
  // String text2;
  // String text3;
  // bool? variable=true;
  final Function(num) onDataChanged;
  Widget widget;
  VehicleChoiceWidget({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    // this.variable,
    required this.widget,
    required this.onDataChanged, required this.id,
  }) : super(key: key);

  @override
  State<VehicleChoiceWidget> createState() => _VehicleChoiceWidgetState();
}

class _VehicleChoiceWidgetState extends State<VehicleChoiceWidget> {
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
bool _isExpanded = false;
 void _handleTap() {
    setState(() {
      _isExpanded = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => ProductsInWareBloc()
      // ..add(getCities())
      ,
      child: Builder(
        
        builder: (context) {
          context.read<ProductsInWareBloc>().add(GetAllProductsInWare(id:widget.id.toInt() ));
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
                Icon(Icons.bus_alert,color: AppColor.purple3,),
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
            backgroundColor: AppColor.white,
            collapsedShape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            collapsedBackgroundColor:AppColor.white,
            textColor: AppColor.black,
            iconColor: AppColor.black,
            children: [
              BlocBuilder<ProductsInWareBloc, ProductsInWareState>(
                builder: (context, state) {
                  if (state is SuccessGetProducts) {
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
                              itemCount: state.listProductInWareInState.vehciles.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                 someFunctionThatChangesData(state.listProductInWareInState.vehciles[index].id!);
                                 _handleTap();
                                  setState(() {
                                //  variabl==false;
                                 print(_isExpanded);
                                  // تحديث الحالة بالقيمة الجديدة
                                  selectedTitle = state.listProductInWareInState.vehciles[index].name;
          
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
                                            text: state.listProductInWareInState.vehciles[index].name!
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
                  } else if (state is LoadedGetProducts) {
                    return Center(
                        child: Lottie.asset("assets/lottie/loading.json",
                              width: 200, height: 100));
                  } else if (state is EmptyGetProducts) {
                    return Center(
                    child: Column(
                      children: [
                        Lottie.asset("assets/lottie/empty.json",
                            width: 200, height: 100),
                        Text("Empty")
                      ],
                    ),
                  );
                  } else {
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
