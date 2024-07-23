import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

class WidgetOrdreProduct extends StatelessWidget {
  const WidgetOrdreProduct({super.key, required this.fillColor, required this.image, required this.title, required this.subTitle, required this.subtitle2});
  final Color fillColor;
final String image;
  final String title;
  final String subTitle;
  final String subtitle2;
  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15,0),
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
                            child: Image.asset('$image'),
                          ),
                        ),
                        SizedBox(width: 30,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$title',
                              style: const TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w800),
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
                                   fontWeight: FontWeight.w600
                                ),
                               
                             )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
              
  }
}