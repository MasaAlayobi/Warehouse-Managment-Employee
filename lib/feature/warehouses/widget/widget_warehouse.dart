import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/productOfWareWithDetails/productsInWare/view/product_in_ware.dart';

class WidgetWarehouse extends StatelessWidget {
  WidgetWarehouse(
      {super.key,
      this.image,
      this.title,
      this.position,
      required this.id,
      this.veicles,
      this.subTitle});
  final String? image;
  int id;
  final String? title;
  final String? veicles;

  final String? subTitle;
  final String? position;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductInWares(id: id),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: SizedBox(
          height: 100,
          child: Card(
            color: AppColor.white,
            elevation: 13,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    width: 90,
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColor.purple5),
                    child: Image.asset('$image'),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$subTitle',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: Container(
                                    width: 100,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: AppColor.grey1,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Warehouses Info :',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              color: AppColor.purple5,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'Name : $title .',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'Number : $subTitle .',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                'Position : $position',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'More Details',
                            style: TextStyle(
                                color: AppColor.purple2,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
