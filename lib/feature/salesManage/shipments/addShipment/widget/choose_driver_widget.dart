import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/bloc/add_shipment_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/bloc/all_shipment_bloc.dart';

class ChooseDriverWidget extends StatefulWidget {
  String text1;
  // String text2;
  // String text3;
  // bool? variable=true;
  final Function(num) onDataChanged;
  Widget widget;
  ChooseDriverWidget({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    // this.variable,
    required this.widget,
    required this.onDataChanged,
  }) : super(key: key);

  @override
  State<ChooseDriverWidget> createState() => _ChooseDriverWidgetState();
}

class _ChooseDriverWidgetState extends State<ChooseDriverWidget> {
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
      create: (context) => AddShipmentBloc()
      // ..add(getCities())
      ,
      child: Builder(

        builder: (context) {
          context.read<AddShipmentBloc>().add((GetAllDriver()));
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
            title: Row(
              children: [
                Icon(Icons.person_add_rounded,color: AppColor.purple3,),
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
              BlocBuilder<AddShipmentBloc, AddShipmentState>(
                builder: (context, state) {
                  if (state is SuccessFetchAllDriver) {
           
                         return   ListView.separated(
                              itemCount:state.allDriver.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                 someFunctionThatChangesData(state.allDriver[index].id);
                                 _handleTap();
                                  setState(() {
                                //  variabl==false;
                                 print(_isExpanded);
                                  // تحديث الحالة بالقيمة الجديدة
                                  selectedTitle = state.allDriver[index].name;
          
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
                                            text: state.allDriver[index].name!
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
                  }  else if (state is NotGetDriver) {
                return Center(
                  child: 
                      Lottie.asset("assets/lottie/empty.json",
                          width: 200, height: 100),
                     
                   
                );
              } else if (state is LoadingDriv) {
                return Center(
                  child: 
                      Lottie.asset("assets/lottie/loading.json",
                          width: 200, height: 100),
                   
                );
              }
              return Center(child: Text("try again latter"));
            
                },
              )
            ],
          );
        }
      ),
    );
  }
}
