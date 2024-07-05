import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetShipmentsAndOrders extends StatefulWidget {
  const WidgetShipmentsAndOrders({super.key});

  @override
  State<WidgetShipmentsAndOrders> createState() => _WidgetShipmentsAndOrdersState();
}
bool _isExpanded = false;
class _WidgetShipmentsAndOrdersState extends State<WidgetShipmentsAndOrders> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20)),
                    // height: _isExpanded ? null : 100, // الطول عندما تكون مغلقة
                    child: ExpansionTile(
                      leading: Container(
                          height: 100,
                           width: 80,
                          decoration: BoxDecoration(
                              color: AppColor.purple5,
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset('assets/images/charges.png')),
                      subtitle: Container(
                        height: 70,
                        // color: AppColor.purple1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Date: 2004/1/1',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            Container(
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Delivery Agent: el-mahaseeb',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            Container(
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Delivery Num: 0957257941',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                          ],
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          '#505EE0',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onExpansionChanged: (bool expanded) {
                        // if (expanded == true)
                          // setState(() => _isExpanded = expanded);
                      },
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.purple1,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListView.builder(
                                shrinkWrap: true, // مهم لتجنب مشاكل التخطيط
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        
                                      if (index == 0)

                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('  Order :',
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                                color: AppColor.black)),
                                      ),
                                      
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                            onTap: () {

                                                  GoRouter.of(context).push(AppRouter.kOrderDetailsView);
                                              return ExpansionTileController.of(
                                                      context)
                                                  .collapse();
                                            },
                                            child: Card(
                                              elevation: 5,
                                              color: AppColor.white,
                                              child: Container(
                                                  height: 110,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: AppColor.white),
                                                  child:Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Container(
                                                          width: 80,
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(8),
                                                            color: AppColor.purple5
                                                          ),
                                                          child: Image.asset('assets/images/order.png')),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                           Container(
                                                            width: MediaQuery.of(context).size.width/2.7,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'client : Tamer Hossni',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            Container(
                              width: MediaQuery.of(context).size.width/2.7,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'storehouse : Tamer ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                            Container(
                              width: MediaQuery.of(context).size.width/2.7,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Total  : 149999.99\$',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                                    Container(
                              width: MediaQuery.of(context).size.width/2.7,
                                child: FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      'Order Status: Packging',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ))),
                                                        ],
                                                      )
                                                    ],
                                                  ) ),
                                            )),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    )),
              );
  }
}