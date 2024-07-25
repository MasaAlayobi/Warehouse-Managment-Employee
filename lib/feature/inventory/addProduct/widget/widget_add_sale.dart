import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetAddSale extends StatelessWidget {
   WidgetAddSale({super.key, required this.purchasingPrice, required this.salePrice});
 final TextEditingController purchasingPrice;
 final TextEditingController salePrice;

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
                      child: Text('Salse Summary',
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
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: MediaQuery.of(context).size.height / 6.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.purple5),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Purchasing  \n price :',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.black)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                height: MediaQuery.of(context).size.height / 14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                   child:  Center(
                                  child: CustomTextField(nameText: 'Add price',  readOnly:true,nameController: purchasingPrice,),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: MediaQuery.of(context).size.height / 6.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.purple5),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('selling  \n price :',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.black)),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 2.8,
                                height: MediaQuery.of(context).size.height / 14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                     child: Center(
                                  child: CustomTextField(nameText: 'Add price',  readOnly:true,nameController: salePrice,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}