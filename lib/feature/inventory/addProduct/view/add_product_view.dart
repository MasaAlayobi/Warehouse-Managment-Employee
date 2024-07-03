import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_quantity.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_sale.dart';

class AddProductView extends StatelessWidget {
   AddProductView({super.key});

  @override
    TextEditingController quantityForSale=TextEditingController();
  TextEditingController completeNumber=TextEditingController();
  TextEditingController minimumQuantity=TextEditingController();
   final TextEditingController purchasingPrice=TextEditingController();
 final TextEditingController salePrice=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppbar(isnNotification: false, ispop: true,title: 'Add Product',),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [AppColor.purple1, AppColor.purple4]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            style:BorderStyle.solid,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignCenter
                          )
                          // color: AppColor.purple5
                        ),
                        //  color: AppColor.black,
                        child: Center(
                            child: Icon(Icons.add_a_photo_outlined,size: 60,)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          height:MediaQuery.of(context).size.height/20 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white
                          ),
                          child: CustomTextField(nameText: 'Product name', readOnly: false),
                        ),
                       Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          height:MediaQuery.of(context).size.height/20 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white
                          ),
                          child: CustomTextField(nameText: 'SKU', readOnly: false,icon: Icons.qr_code_2,),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          height:MediaQuery.of(context).size.height/20 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white
                          ),
                          child: CustomTextField(nameText: 'Weight', readOnly: false),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1.8,
                          height:MediaQuery.of(context).size.height/20 ,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.white
                          ),
                          child: CustomTextField(nameText: 'Size', readOnly: false,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
        
              WidgetAddQuantity(quantityForSale: quantityForSale, completeNumber: completeNumber, minimumQuantity: minimumQuantity),
              SizedBox(height: 20,),
              WidgetAddSale(purchasingPrice: purchasingPrice, salePrice: salePrice)
          ],
        ),
      ),
    );
  }
}