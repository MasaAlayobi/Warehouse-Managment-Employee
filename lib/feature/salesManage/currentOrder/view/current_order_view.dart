import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/widget/widget_new_order.dart';

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: CustomDrawer(),
       appBar: CustomAppbar(isnNotification: false, ispop: true,title: 'New orders',),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: 10,
          ),
          Text('    Orders :',
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
              return WidgetNewOrder();
            },
          ))
        ],
       ),
       floatingActionButton: Align(
        alignment: Alignment(0.9,0.97),
        child: FloatingActionButton(
          child:Icon(Icons.add,color: AppColor.white,size: 35,),
          backgroundColor:AppColor.purple4,
        
          onPressed: (){
            GoRouter.of(context).push(AppRouter.kAddProductView);
          }),
      ),
    );
  }
}