import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetNewOrder extends StatelessWidget {
  const WidgetNewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: () {
            // return ExpansionTileController.of(context).collapse();
          },
          child: Card(
            elevation: 8,
            color: AppColor.white,
            child: Container(
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 80,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColor.purple5),
                          child: Image.asset('assets/images/order.png')),
                    ),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  'client : Tamer Hossni',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ))),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  'storehouse : Tamer ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ))),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.7,
                            child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  'Total  : 149999.99\$',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ))),
                        Container(
                            width: MediaQuery.of(context).size.width / 2.7,
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
                )),
          )),
    );
  }
}
