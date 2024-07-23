import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/orderDetails/widget/widget_ordre_product.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Order details',
      ),
      drawer: CustomDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: AppColor.purple4),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      child: Image.asset('assets/images/img.png'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'client : Tamer Hossni',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.white),
                                  ))),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Order No : 505EE0 ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                         color: AppColor.white),
                                  ))),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Total  : 149999.99\$',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                         color: AppColor.white),
                                  ))),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Order Status: Packging',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                         color: AppColor.white),
                                  ))),
                                   Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Payment status : cash',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                         color: AppColor.white),
                                  ))),
                        ])
                  ],
                ),
                SizedBox(height: 10,),
                 Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Manager acceptance: Yes',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.white),
                                  ))),
                          Container(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    'Order date : 2004 / 1 / 1 ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                         color: AppColor.white),
                                  ))),
              ],
            ),
          ),
          SizedBox(height: 10,),
           Text('  Ordre Product :',
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                  color: AppColor.black)),
               SizedBox(
            height: 10,
          ), 
          Expanded(child: ListView.builder(
            itemCount: 12,
            itemBuilder: 
          (context, index) {
            return WidgetOrdreProduct(fillColor: AppColor.white, image: 'assets/images/Rectangle (4).png', title: 'Adidas Shose', subTitle: 'Price :119.99\$', subtitle2: 'Quantity:1200');
          },))  
        ],
      ),
    );
  }
}
