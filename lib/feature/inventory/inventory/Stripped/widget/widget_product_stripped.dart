import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetProductStripped extends StatelessWidget {
  WidgetProductStripped(
      {super.key,
      required this.fillColor,
      this.myButton,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.subtitle2});
  final Color fillColor;
  final String image;
  final Widget? myButton;
  final String title;
  final String subTitle;
  final String subtitle2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: SizedBox(
        height: 135,
        child: Card(
          color: fillColor,
          elevation: 13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  width: 90,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // color: AppColor.purple5
                  ),
                  child: image.isNotEmpty
                      ? Image.network(
                          image,
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/no_photo.png',
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 3,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/no_photo.png',
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                        ),
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
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width/5,
                  // ),

                  Text(
                    '$subtitle2',
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  myButton ?? Text("")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
