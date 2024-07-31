// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/cardOfProduct.dart';

import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/quality/widget/SMBSinquality.dart';

class DamageView extends StatelessWidget {
  DamageView({super.key});
  TextEditingController nameOfProduct = TextEditingController();
  TextEditingController describeOfProduct = TextEditingController();
  TextEditingController quantityOfProduct = TextEditingController();
  TextEditingController priceOfProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.purple1,
        body: Padding(
          padding: const EdgeInsets.only(top: 22.0, left: 11, right: 11),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                crossAxisCount: 2,
                childAspectRatio: 0.5),
            itemCount: 11,
            itemBuilder: (context, index) {
              return CardOfProduct(
                onTapCard: () {
                  
                },
                  name: "ADIDAS",
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return showMBSInQuality(
                              nameOfProductController: nameOfProduct,
                              quantityOfProductController: quantityOfProduct,
                              priceOfProductController: priceOfProduct,
                              describeOfProductController: describeOfProduct);
                        });
                  },
                  image: Image.asset(
                    "assets/images/Rectangle (4).png",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height / 5,
                    // width: MediaQuery.of(context).size.width / 1.1,
                  ),
                  textOfButtom: "Edit product",
                  price: "100\$",
                  sku: "10");
            },
          ),
        ),
      ),
    );
  }
}
