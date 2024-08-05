import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_search.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/view/login_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/bloc/items_stripped_bloc.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/view/stripped_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/notStripped/view/not_stripped_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  TextEditingController search=TextEditingController();
class InventoryView extends StatelessWidget {
   InventoryView({super.key});
 
  @override
//  TabController _tabController = TabController(length: 3, vsync: vsync);
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        
        return DefaultTabController(
                    length: 2, 
        
          child: Scaffold(
            backgroundColor: AppColor.purple1,
             drawer: CustomDrawer(),
            appBar: CustomAppbar(isnNotification: true,title: 'Product',ispop: false,),
            body: Column(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,
                    height: 40,
                    
                    child: CustomSearch(nameText: 'search', readOnly: false, nameController: search,onChanged: (p0) {
                      search.text == p0;
                                  context
            .read<ItemsStrippedBloc>()
            .add(GetAllItemInStripped(lable: search.text));
                    },)),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColor.purple4,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(20),bottomLeft: Radius.circular(0)),
                  ),
                  child: TabBar(
                    // indicatorColor: AppColor.pink,
                    // labelColor: AppColor.purple2,
                    // controller: _tabController,
                      indicator: UnderlineTabIndicator(
                                    borderSide: BorderSide(
                                        width: 4.0, color: AppColor.purple1)),
                                // padding:,
                                indicatorWeight: 3,
                                indicatorColor: AppColor.purple1,
                                isScrollable: false,
                    tabs: [
                    Text('Stripped',style: TextStyle(color: AppColor.purple1,fontSize: 16,fontWeight: FontWeight.bold),),
                    Text('Not stripped',style: TextStyle(color: AppColor.purple1,fontSize: 16,fontWeight: FontWeight.bold)),
                  ]),
                ),
                Expanded(
                  child: TabBarView(
                        children: [
                          // عرض المحتوى للتاب الأول
                          StrippedView(),
                          // عرض المحتوى للتاب الثاني
                          NotStrippedView(),
                        ],
                      ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}