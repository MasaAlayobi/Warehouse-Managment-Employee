import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 215,
        backgroundColor: AppColor.purple2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30))),
                
        child: ListView(
          children: [
            Image.asset(
              'assets/images/backgroundDrawer.png',
              fit: BoxFit.fill,
              height:200,
            ),
            ExpansionTile(
              iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.inventory,
              color: AppColor.purple1,
            ),
            title: const Text(
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
                    const Text('   Inventory',style: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.w600)),
                    Divider(color: AppColor.white,thickness: 2,),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).pushReplacement(AppRouter.KWarehousesView);
                      },
                      child: const Text('   Warehouses',style: TextStyle(color: AppColor.white,fontSize: 16,fontWeight: FontWeight.w600))),
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
                    const Text('   Damaged',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    const Text('   Expiry date',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
            // onTap: () {
            //   // Navigator.pushNamed(context, '/quality');
            // },
          ),
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
                    const Text('   Previous Sales',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    const Text('   Current Orders',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    const Text('   Shipments',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
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
                    const Text('   Previous Purchases',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    Divider(
                      color: AppColor.white,
                      thickness: 2,
                    ),
                    const Text('   Current Orders',
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
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
                    InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.KCustomerView);
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
                    InkWell(
                        onTap: () {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.KSupplierView);
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
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.money,
              color: AppColor.purple1,
            ),
            title: const Text('Debts',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            // onTap: () {
            //   // Navigator.pushNamed(context, '/debts');
            // },
          ),
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.report,
              color: AppColor.purple1,
            ),
            title: const Text('Expenses',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            // onTap: () {
            //   // Navigator.pushNamed(context, '/expenses');
            // },
          ),
          ExpansionTile(
            iconColor: AppColor.white,
            collapsedIconColor: AppColor.white,
            leading: const Icon(
              Icons.insert_chart,
              color: AppColor.purple1,
            ),
            title: InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.KReportView);
                },
                child: const Text('Creat Reporte',
                    style: TextStyle(
                      color: AppColor.purple1,
                    ))),
            // onTap: () {
            //   // Navigator.pushNamed(context, '/report');
            // },
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppColor.purple1,
            ),
            title: const Text('Logout',
                style: TextStyle(
                  color: AppColor.purple1,
                )),
            onTap: () {
              // Implement logout logic
            },
          ),
        ],
      ),
    );
  }
}
