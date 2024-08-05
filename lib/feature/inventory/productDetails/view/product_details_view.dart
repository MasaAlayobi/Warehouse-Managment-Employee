import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_quantity.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_sale.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/widget/widget_quantity.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/widget/widget_sale.dart';

class ProductDetailsView extends StatelessWidget {
   ProductDetailsView({super.key,required this.item});
  ItemInStripped item;
    TextEditingController total_quantity=TextEditingController();
    TextEditingController salePrice=TextEditingController();
    TextEditingController purchasingPrice=TextEditingController();
    TextEditingController start_price=TextEditingController();
  @override
  Widget build(BuildContext context) {
    total_quantity.text=item.total_qty.toString();
    salePrice.text=item.sell_price.toString();
    purchasingPrice.text=item.pur_price.toString();
    start_price.text=item.str_price.toString();
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Product Detail',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: AppColor.black)
                    ),
                    width: MediaQuery.of(context).size.width / 2.9,
                    height: MediaQuery.of(context).size.height / 6,
                    //  color: AppColor.black,
                    child: Center(
                        child: item.photo != null
                            ? Image.network(
                                            item.photo!,
                                            fit: BoxFit.cover,
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width /
                                            //     4,
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height /
                                            //     3,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/no_photo.png',
                                                // fit: BoxFit.contain,
                                                // width: MediaQuery.of(context)
                                                //         .size
                                                //         .width /
                                                //     4,
                                                // height: MediaQuery.of(context)
                                                //         .size
                                                //         .height /
                                                //     3,
                                              );
                                            },
                                          )
                                        : Image.asset(
                                            'assets/images/no_photo.png',
                                             fit: BoxFit.cover,
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width /
                                            //     4,
                                            // height: MediaQuery.of(context)
                                            //         .size
                                            //         .height /
                                            //     3,
                                          )),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(item.name!,
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: AppColor.black)),
                      ),
                      Text('SKU : ${item.SKU}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                      Text('Weight : ${item.weight}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                      Text('size : ${item.size_cubic_meters}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            
            Text('   Details : ',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: AppColor.black)),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.pink,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: MediaQuery.of(context).size.width / 1.3,
                height: 60,
                child: Center(
                  child: HeaderText(
                                text:'Unit : ${item.unit.toString()}',
                                textcolor: AppColor.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
             WidgetAddQuantity(total_quantity:total_quantity ,readOnly: true,),
            SizedBox(
              height: 20,
            ),
            WidgetAddSale(purchasingPrice: purchasingPrice, salePrice: salePrice, start_price: start_price,readOnly: true,),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
