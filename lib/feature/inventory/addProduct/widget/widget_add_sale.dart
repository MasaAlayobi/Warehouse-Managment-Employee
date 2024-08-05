import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetAddSale extends StatelessWidget {
   WidgetAddSale({super.key, required this.purchasingPrice, required this.salePrice, required this.start_price,this.readOnly});
   bool? readOnly;
 final TextEditingController purchasingPrice;
 final TextEditingController salePrice;
 final  TextEditingController start_price;
  @override
  Widget build(BuildContext context) {
    return Center(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.65,
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
                                height: MediaQuery.of(context).size.height / 16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                   child:  Center(
                                  child: CustomTextField(nameText: 'Add price',  readOnly:readOnly==null?false:true,nameController: purchasingPrice,),
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
                                height: MediaQuery.of(context).size.height / 16,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white),
                                     child: Center(
                                  child: CustomTextField(nameText: 'Add price',  readOnly:readOnly==null?false:true,nameController: salePrice,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 8.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.pink),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('  Start price : ',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.black)),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 16,//18
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                                child: Center(
                                  child: CustomTextField(nameText: 'Add price',  readOnly:readOnly==null?false:true,nameController: start_price,),
                                ),
                          ),
                          SizedBox(height: 4,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}