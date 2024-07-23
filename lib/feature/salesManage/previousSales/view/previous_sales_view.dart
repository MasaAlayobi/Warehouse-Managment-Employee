import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/widget/widget_shipments_and_orders.dart';

class PreviousSalesView extends StatefulWidget {
  const PreviousSalesView({super.key});

  @override
  State<PreviousSalesView> createState() => _PreviousSalesViewState();
}



class _PreviousSalesViewState extends State<PreviousSalesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        ispop: true,
        title: 'Previous Sales',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text('  Charges :',
              style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: AppColor.black)),
               SizedBox(
            height: 10,
          ),    
          Expanded(
              child: ListView.builder(
            itemCount: 17,
            itemBuilder: (context, index) {
              return WidgetShipmentsAndOrders();
            },
          ))
        ],
      ),
    );
  }
}
