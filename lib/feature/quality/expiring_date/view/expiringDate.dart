import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/config/widget/oneNestedExpansionTile.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/quality/widget/SMBSinquality.dart';

class ExpiringDateView extends StatelessWidget {
  const ExpiringDateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: CustomDrawer(),
      appBar: CustomAppbar(
        isnNotification: false,
        title: 'expiring date',
        ispop: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: HeaderText(
                  text: "select time:",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myNestedExpansionTile(
                        isAppearClock: true,
                        text1: "last week",
                        children: List.generate(
                          4,
                          (index) => Align(
                            alignment: index % 2 == 0
                                ? Alignment.bottomLeft
                                : Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1.0, vertical: 11),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Card(
                                    elevation: 11,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              "assets/images/Rectangle (4).png",
                                              fit: BoxFit.fill,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  5,
                                              // width: MediaQuery.of(context).size.width / 1.1,
                                            ),
                                          ),
                                          Divider(
                                              color: const Color.fromARGB(
                                                  255, 1, 206, 83)),
                                          Align(
                                            alignment: Alignment.center,
                                            child: HeaderText(
                                                text: "ADIDAS",
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: HeaderText(
                                                    text:
                                                        "quantity of expired date product:",
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Align(
                                                alignment: Alignment.bottomLeft,
                                                child: HeaderText(
                                                    text: " 300",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: HeaderText(
                                                    text: "expired date:",
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Align(
                                                alignment: Alignment.topLeft,
                                                child: HeaderText(
                                                    textcolor: AppColor.red,
                                                    text: " 2033/3/3,",
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              SizedBox(
                                                width: 11,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: HeaderText(
                                                        text: "price:",
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: HeaderText(
                                                        text: " 1000\$",
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        )),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
