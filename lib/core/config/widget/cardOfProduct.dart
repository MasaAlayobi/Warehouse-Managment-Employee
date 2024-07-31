import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';

import '../../resourse/app_color.dart';

class CardOfProduct extends StatelessWidget {
  void Function() onTap;
  void Function() onTapCard;
  Widget image;
  String? textOfButtom;
  String? price;
  String? sku;
  String? name;

  CardOfProduct({
    Key? key,
    required this.name,
    required this.onTap,
    required this.onTapCard,
    required this.image,
    required this.textOfButtom,
    required this.price,
    required this.sku,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCard,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Card(
            elevation: 11,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: image,
                  ),
                  Divider(color: const Color.fromARGB(255, 1, 206, 83)),
                  Align(
                    alignment: Alignment.center,
                    child: HeaderText(
                        text: name!, fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: HeaderText(
                        text: "SKU: $sku",
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: HeaderText(
                        text: "sell price: $price",
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                  sizedBox40(),
                  myButtonWithBorder(
                      onTap: onTap,
                      fillColor: AppColor.green1,
                      height: MediaQuery.of(context).size.height / 22,
                      width: MediaQuery.of(context).size.width / 3,
                      border: Border.all(color: AppColor.green2),
                      radius: 22,
                      text: textOfButtom!,
                      textColor: AppColor.black,
                      fontsize: 15,
                      fontWeight: FontWeight.w300),
                ],
              ),
            )),
      ),
    );
  }
}
