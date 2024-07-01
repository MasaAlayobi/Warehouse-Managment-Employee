import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/widget_ships.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/widget/widget_warehouse.dart';

class WarehousesView extends StatelessWidget {
  const WarehousesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: CustomDrawer(),
      appBar: CustomAppbar(isnNotification: false,title: 'Warehouses',),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8,
          ),
           Text(
            ' Our Warehouses :',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: 16,
            itemBuilder: (context,index){
              return WidgetWarehouse(
                image: 'assets/images/warehouse.png',
                title: 'Warehouse Name',
                subTitle: 'NO:505EE0',
              );
            }))
        ],
      ),
    );
  }
}