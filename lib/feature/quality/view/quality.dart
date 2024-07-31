import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_search.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myFloatingActionButton.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/view/stripped_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/notStripped/view/not_stripped_view.dart';
import 'package:mobile_warehouse_managment/feature/quality/damage/view/damage_view.dart';
import 'package:mobile_warehouse_managment/feature/quality/expireDate/view/expired_date.dart';
import 'package:mobile_warehouse_managment/feature/quality/widget/SMBSinquality.dart';

class QualityView extends StatelessWidget {
  QualityView({super.key});
  TextEditingController addNameOfProduct = TextEditingController();
  TextEditingController addDescribeOfProduct = TextEditingController();
  TextEditingController addQuantityOfProduct = TextEditingController();
  TextEditingController addPriceOfProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: myFloatingActionButtton(
            image: Image.asset(
              fit: BoxFit.contain,
              width: 40,
              height: 40,
              'assets/images/addProduct.png',
            ),
            onPress: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return showMBSInQuality(
                        nameOfProductController: addNameOfProduct,
                        quantityOfProductController: addQuantityOfProduct,
                        priceOfProductController: addPriceOfProduct,
                        describeOfProductController: addDescribeOfProduct);
                  });
            }),
        backgroundColor: AppColor.purple1,
        drawer: CustomDrawer(),
        appBar: CustomAppbar(
          isnNotification: false,
          title: 'Quality',
          ispop: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColor.purple4,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(0)),
              ),
              child: const TabBar(
                  indicator: UnderlineTabIndicator(
                      borderSide:
                          BorderSide(width: 4.0, color: AppColor.purple1)),
                  indicatorWeight: 3,
                  indicatorColor: AppColor.purple1,
                  isScrollable: false,
                  tabs: [
                    Text(
                      'Damaged products',
                      style: TextStyle(
                          color: AppColor.purple1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('Expired products',
                        style: TextStyle(
                            color: AppColor.purple1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ]),
            ),
            Expanded(
              child: TabBarView(
                children: [DamageView(),  ExpiredDate()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
