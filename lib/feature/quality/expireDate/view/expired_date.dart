import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myFloatingActionButton.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/quality/widget/SMBSinquality.dart';

class ExpiredDate extends StatelessWidget {
  ExpiredDate({super.key});
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
          child: ListView.builder(
            itemCount: 11,
            itemBuilder: (context, index) {
              return Align(
                alignment: index % 2 == 0
                    ? Alignment.bottomLeft
                    : Alignment.bottomRight,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 1.0, vertical: 11),
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
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  // width: MediaQuery.of(context).size.width / 1.1,
                                ),
                              ),
                              Divider(
                                  color: const Color.fromARGB(255, 1, 206, 83)),
                              Align(
                                alignment: Alignment.center,
                                child: HeaderText(
                                    text: "ADIDAS",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: HeaderText(
                                    text:
                                        "quantity of expired date product: 30",
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400),
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
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: HeaderText(
                                        textcolor: AppColor.red,
                                        text: " 2033/3/3,",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    width: 11,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: HeaderText(
                                        text: "price: 1000\$",
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              sizedBox40(),
                              myButtonWithBorder(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        builder: (BuildContext context) {
                                          return showMBSInQuality(
                                              nameOfProductController:
                                                  nameOfProduct,
                                              quantityOfProductController:
                                                  quantityOfProduct,
                                              priceOfProductController:
                                                  priceOfProduct,
                                              describeOfProductController:
                                                  describeOfProduct);
                                        });
                                  },
                                  fillColor: AppColor.green1,
                                  height:
                                      MediaQuery.of(context).size.height / 22,
                                  width: MediaQuery.of(context).size.width / 3,
                                  border: Border.all(color: AppColor.green2),
                                  radius: 22,
                                  text: "Edit product",
                                  textColor: AppColor.black,
                                  fontsize: 15,
                                  fontWeight: FontWeight.w300),
                            ],
                          ),
                        )),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
