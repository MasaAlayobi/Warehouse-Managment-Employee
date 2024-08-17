import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/domain/auth_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  List<int>? number;
  @override
  
  Widget build(BuildContext context) {
     String? role = storage
            .get<SharedPreferences>()
            .getString('role');
    
    if (role != null) {
      List<dynamic> jsonList = jsonDecode(role);
      setState(() {
        number = jsonList.map((e) => e as int).toList();
      });
      print(number);
    }
  
    return Drawer(
      width: 215,
      backgroundColor: AppColor.purple2,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: ListView(
        children: [
          Lottie.asset(
            'assets/lottie/truck.json',
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppColor.purple1,
            ),
            title: const Text('Home',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHomeView);
            },
          ),
          if(number!.contains(4)||number!.contains(3)||number!.contains(1))
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.inventory,
              color: AppColor.purple1,
            ),
            title:
            const Text(
              'Inventory',
              style: TextStyle(
                color: AppColor.purple1,
              ),
            ),
            children: [
              Container(
                height: 80,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.purple6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     if(number!.contains(1)||number!.contains(3))
                    InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kInventoryView);
                        },
                        child: const Text('   Inventory',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    if(number!.contains(1)||number!.contains(4))
                    InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kWarehousesView);
                        },
                        child: const Text('   Warehouses',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
            ],
            // onTap: () {
            //   // Navigator.pushNamed(context, '/inventory');
            // },
          ),
          ExpansionTile(
            // showTrailingIcon: Icons.abc,
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.high_quality,
              color: AppColor.purple1,
            ),
            title: const Text('The Quality',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            children: [
              Container(
                height: 80,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.purple6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kQualityView);
                      },
                      child: const Text('   Damaged products',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kExpiringDateView);
                      },
                      child: Text('   Expiring date',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ],
            // onTap: () {
            // Navigator.pushNamed(context, '/quality');
            // },
          ),
          if(number!.contains(5)||number!.contains(6)||number!.contains(7)||number!.contains(8))
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.person,
              color: AppColor.purple1,
            ),
            title: const Text('Sales Manage',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            children: [
              Container(
                height: 130,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.purple6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              if(number!.contains(5)||number!.contains(6))
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kPreviousSalesView);
                      },
                      child: const Text('   Previous Sales',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    if(number!.contains(7)||number!.contains(5))
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kCurrentOrderView);
                      },
                      child: const Text('   Current Orders',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    if(number!.contains(8)||(number!.contains(5)))
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.kAllShipmentsView);
                      },
                      child: const Text('   Shipments',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ],
          ),
           if(number!.contains(9)||number!.contains(10)||number!.contains(11))
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.shopping_cart,
              color: AppColor.purple1,
            ),
            title: const Text('Purchasing manage',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            children: [
              Container(
                height: 80,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.purple6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     if(number!.contains(9)||(number!.contains(10)))
                    InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kPreviousPurchasesView);
                      },
                      child: const Text('   Previous Purchases',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                     if(number!.contains(9)||(number!.contains(11)))
                    InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .push(AppRouter.kCurrentOrderPurchases);
                      },
                      child: const Text('   Current Orders',
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
            ],
          ),
           if(number!.contains(12)||(number!.contains(13)))
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.account_box,
              color: AppColor.purple1,
            ),
            title: const Text('Client',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            children: [
              Container(
                height: 80,
                width: 180,
                decoration: BoxDecoration(
                  color: AppColor.purple6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     if(number!.contains(12))
                    InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.KCustomerView);
                        },
                        child: const Text('   Customers',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                     if(number!.contains(13))
                    InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.KSupplierView);
                        },
                        child: const Text('   Suppliers',
                            style: TextStyle(
                                color: AppColor.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
            ],
          ),
          // ExpansionTile(
          //   iconColor: AppColor.white,
          //   collapsedIconColor: AppColor.white,
          //   leading: const Icon(
          //     Icons.insert_chart,
          //     color: AppColor.purple1,
          //   ),
          //   title: InkWell(
          //       onTap: () {
          //         GoRouter.of(context).push(AppRouter.KReportView);
          //       },
          //       child: const Text('Creat Reporte',
          //           style: TextStyle(
          //             color: AppColor.purple1,
          //           ))),
          //   // onTap: () {
          //   //   // Navigator.pushNamed(context, '/report');
          //   // },
          // ),
          ListTile(
            leading: const Icon(
              Icons.report,
              color: AppColor.purple1,
            ),
            title: const Text('complaint to\n your manager',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kComplainToAdminView);

              // Implement logout logic
            },
          ),
          const SizedBox(height: 30),
          Align(
            alignment: Alignment.centerLeft,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: AppColor.purple1,
                ),
                title: const Text('Logout',
                    style: TextStyle(
                      color: AppColor.purple1,
                    )),
                onTap: () async {
                  var res = await AuthServiceImp().logout();
                  try {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        backgroundColor: AppColor.green2,
                        content: SizedBox(
                            height: 50,
                            child: Center(
                                child: SubTitle3(text: res.toString())))));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 3),
                        backgroundColor: AppColor.red,
                        content: SizedBox(
                            height: 50,
                            child:
                                Center(child: SubTitle3(text: e.toString())))));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
