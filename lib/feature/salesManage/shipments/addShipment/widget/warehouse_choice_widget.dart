import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/showWare/bloc/warehouses_bloc.dart';

class WarehouseChoiceWidget extends StatefulWidget {
  String text1;
  // String text2;
  // String text3;
  // bool? variable=true;
  final Function(num) onDataChanged;
  Widget widget;
  WarehouseChoiceWidget({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    // this.variable,
    required this.widget,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<WarehouseChoiceWidget> createState() => _WarehouseChoiceWidgetState();
}

class _WarehouseChoiceWidgetState extends State<WarehouseChoiceWidget> {
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
      create: (context) => WarehousesBloc()
      // ..add(getCities())
      ,
      child: Builder(

        builder: (context) {
          context.read<WarehousesBloc>()..add(GetAllWarehouses());
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
            title: Text(
              selectedTitle!,
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: AppColor.purple3,
            collapsedShape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            collapsedBackgroundColor:AppColor.purple3,
            textColor: AppColor.black,
            iconColor: AppColor.black,
            children: [
              BlocBuilder<WarehousesBloc, WarehousesState>(
                builder: (context, state) {
                  if (state is SuccessGetWarehouses) {
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
                              itemCount: state.listWarehouseInState.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                 someFunctionThatChangesData(state.listWarehouseInState[index].id);
                                 _handleTap();
                                  setState(() {
                                //  variabl==false;
                                 print(_isExpanded);
                                  // تحديث الحالة بالقيمة الجديدة
                                  selectedTitle = state.listWarehouseInState[index].name;
          
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
                                            text: state.listWarehouseInState[index].name!
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
                  } else if (state is LoadedGetWarehouse) {
                    return Center(
                        child: Lottie.asset("assets/lottie/loading.json",
                              width: 200, height: 333));
                  } else if (state is EmptyGetWarehouse) {
                    return Center(
                      child: Text('لا يوجد مستودعات لعرضها '),
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
