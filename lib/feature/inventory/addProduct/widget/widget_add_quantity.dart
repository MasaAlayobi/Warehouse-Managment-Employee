import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetAddQuantity extends StatelessWidget {
    WidgetAddQuantity({super.key, required this.total_quantity,this.readOnly});
    bool? readOnly;
final  TextEditingController total_quantity;
// final  TextEditingController completeNumber;
// final  TextEditingController minimumQuantity;

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.purple4,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text('Inventory summary',
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColor.black)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.purple5),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total quantity:',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.black)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.8,
                                height: MediaQuery.of(context).size.height / 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                     child: Center(
                                  child: CustomTextField(nameText: 'Add number',  readOnly:readOnly==null?false:true,nameController:total_quantity ,),
                                ),
                              )
                            ],
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 2.6,
                        //   height: MediaQuery.of(context).size.height / 6.5,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: AppColor.purple5),
                        //   child: Column(
                        //     // crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Text('Complete  \n number :',
                        //           style: const TextStyle(
                        //               fontSize: 18,
                        //               fontWeight: FontWeight.w700,
                        //               color: AppColor.black)),
                        //       SizedBox(
                        //         height: 5,
                        //       ),
                        //       Container(
                        //         width: MediaQuery.of(context).size.width / 2.8,
                        //         height: MediaQuery.of(context).size.height / 14,
                        //         decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(10),
                        //             color: AppColor.white),
                        //              child: Center(
                        //           child: CustomTextField(nameText: 'Add number',  readOnly:false,nameController: completeNumber,),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    
                  ],
                ),
              ),
            );
  }
}