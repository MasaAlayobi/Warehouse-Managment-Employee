import 'package:flutter/material.dart';

import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class TwoNestedExpansionTile extends StatelessWidget {
  final String textOfExpansionTile1;

  final Color? colorTextOfExpansionTile1;
  final Color? fillColorOfExpansionTile1;

  final double sizeTextOfExpansionTile1;
  final double sizeTextOfExpansionTile2;
  final double radius;

  final bool? variable;
  final int lengthOfExpansionTile2;

  // final List<Widget> children;
  final Color? fillColorOfExpanionTile2;
  final Color? fillColorOfChildrenExpanionTile2;
  final Color? colorTextOfExpansionTile2;

  TwoNestedExpansionTile({
    Key? key,
    required this.textOfExpansionTile1,
    this.colorTextOfExpansionTile1,
    this.fillColorOfExpansionTile1,
    required this.sizeTextOfExpansionTile1,
    required this.sizeTextOfExpansionTile2,
    required this.radius,
    this.variable,
    required this.lengthOfExpansionTile2,
    // required this.children,
    this.fillColorOfExpanionTile2,
    this.fillColorOfChildrenExpanionTile2,
    this.colorTextOfExpansionTile2,
  }) : super(key: key);
  List<String> textExpansionTile2 = [
    "Sales",
    "Purechases",
  ];
  List<String> sales = [
    "Sales of customers",
    "sales of inventory",
  ];
  List<String> purchase = ["purchases by supplier", "purchases by inventory"];
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        title: HeaderText(
            text: textOfExpansionTile1,
            textcolor: colorTextOfExpansionTile1,
            fontSize: sizeTextOfExpansionTile1,
            fontWeight: FontWeight.w600),
        backgroundColor: fillColorOfExpansionTile1,
        iconColor: AppColor.purple3,
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        collapsedBackgroundColor: fillColorOfExpansionTile1,
        children: [
          ExpansionTile(
              title: HeaderText(
                  text: "Sales",
                  textcolor: colorTextOfExpansionTile2,
                  fontSize: sizeTextOfExpansionTile2,
                  fontWeight: FontWeight.w400),
              backgroundColor: fillColorOfExpanionTile2,
              collapsedShape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              collapsedBackgroundColor: fillColorOfChildrenExpanionTile2,
              children: List.generate(2, (index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(purchase[index]),
                      textColor: AppColor.grey1,
                    ),
                    const Divider(
                      color: AppColor.grey1,
                      endIndent: 33,
                      indent: 33,
                    )
                  ],
                );
              })),
          ExpansionTile(
              title: HeaderText(
                  text: "Purchases",
                  textcolor: colorTextOfExpansionTile2,
                  fontSize: sizeTextOfExpansionTile2,
                  fontWeight: FontWeight.w400),
              backgroundColor: fillColorOfExpanionTile2,
              collapsedShape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(1))),
              collapsedBackgroundColor: fillColorOfChildrenExpanionTile2,
              children: List.generate(2, (index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(purchase[index]),
                      textColor: AppColor.grey1,
                    ),
                    const Divider(
                      color: AppColor.grey1,
                      endIndent: 33,
                      indent: 33,
                    )
                  ],
                );
              })),
        ]);
  }
}
