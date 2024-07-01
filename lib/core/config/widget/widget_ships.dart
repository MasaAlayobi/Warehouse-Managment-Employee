import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetShips extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
 WidgetShips({super.key, this.image, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15,0),
                child: SizedBox(
                  height: 100,
                  child: Card(
                    color: AppColor.white,
                    elevation: 10,
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
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '$title',
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '$subTitle',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
           
  }
}