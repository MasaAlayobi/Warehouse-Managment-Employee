import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/widget/widget_quantity.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/widget/widget_sale.dart';

class ProductDetailsInWareView extends StatelessWidget {
  WarehouseproductModel product;
  ProductDetailsInWareView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: MediaQuery.of(context).size.height / 5,
                    //  color: AppColor.black,
                    child: Center(
                        child: Image.asset('assets/images/Rectangle (4).png')),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(product.name.toString(),
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: AppColor.black)),
                      ),
                      Text('SKU : ${product.SKU}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                      Text('Weight : ${product.weight}',
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColor.black)),
                      Text(
                          'size : ${product.size_cubic_meters} ${product.unit}',
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
            WidgetQuantity(
                minProduct: product.min_qty.toString(),
                combleteNumber: product.real_qty.toString(),
                quantityForSele: product.available_qty.toString()),
            SizedBox(
              height: 20,
            ),
            WidgetSale(
                sellPrice: product.sell_price.toString(),
                purPrice: product.pur_price.toString()),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
