import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class ShowMBSInware extends StatelessWidget {
  ShowMBSInware({
    super.key,
    required this.realQuantityController,
    required this.availableQantityController,
    required this.minQuantityController,
    required this.onTapEdit,
  });

  final TextEditingController realQuantityController;
  final TextEditingController availableQantityController;
  void Function() onTapEdit;
  final TextEditingController minQuantityController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          // height: MediaQuery.of(context).size.height / 1.5,
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: myTextFieldNumber(
                          ReadeOnly: false,
                          phoneText: "real quantity",
                          phoneController: realQuantityController),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: myTextFieldNumber(
                          ReadeOnly: false,
                          phoneText: "available quantity",
                          phoneController: availableQantityController),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: myTextFieldNumber(
                    ReadeOnly: false,
                    phoneText: "min quantity",
                    phoneController: minQuantityController),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myButtonWithBorder(
                        fillColor: AppColor.green1,
                        onTap: onTapEdit,
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        border: Border.all(color: AppColor.green2),
                        radius: 11,
                        text: "Edit",
                        textColor: AppColor.black,
                        fontsize: 15,
                        fontWeight: FontWeight.w300),
                    myButtonWithBorder(
                        fillColor: const Color.fromARGB(255, 246, 168, 168),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
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
