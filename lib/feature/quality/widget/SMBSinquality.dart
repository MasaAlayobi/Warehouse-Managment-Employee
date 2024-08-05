import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class showMBSInQuality extends StatelessWidget {
  const showMBSInQuality({
    super.key,
    required this.nameOfProductController,
    required this.quantityOfProductController,
    required this.priceOfProductController,
    required this.describeOfProductController,
  });

  final TextEditingController nameOfProductController;
  final TextEditingController quantityOfProductController;
  final TextEditingController priceOfProductController;
  final TextEditingController describeOfProductController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.4,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(33)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const sizedBox40(),
              CircleAvatar(
                radius: 55,
                child: Image.asset(
                  "assets/images/addProduct.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: myTextFieldName(
                    readOnly: false,
                    nameText: "name of product",
                    hintStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    nameController: nameOfProductController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: myTextFieldNumber(
                          ReadeOnly: false,
                          phoneText: "quantity",
                          phoneController: quantityOfProductController),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: myTextFieldNumber(
                          ReadeOnly: false,
                          phoneText: "price",
                          phoneController: priceOfProductController),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: myTextFieldName(
                    readOnly: false,
                    nameText: "describtion",
                    hintStyle:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    nameController: describeOfProductController),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myButtonWithBorder(
                        fillColor: AppColor.green1,
                        onTap: () {},
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        border: Border.all(color: AppColor.green2),
                        radius: 11,
                        text: "agree",
                        textColor: AppColor.black,
                        fontsize: 15,
                        fontWeight: FontWeight.w300),
                    myButtonWithBorder(
                        fillColor: const Color.fromARGB(255, 246, 168, 168),
                        onTap: () {},
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        border: Border.all(color: AppColor.red),
                        radius: 11,
                        text: "cancel",
                        textColor: AppColor.black,
                        fontsize: 15,
                        fontWeight: FontWeight.w300)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
