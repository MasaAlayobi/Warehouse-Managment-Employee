import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';

import 'package:mobile_warehouse_managment/core/config/widget/widget_ships.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// TextEditingController sDate = TextEditingController();
// TextEditingController lDate = TextEditingController();

class _HomeViewState extends State<HomeView> {
  dynamic _currentPage = 0;

  final List<String> _productImages = [
    'https://picsum.photos/200',
    'https://picsum.photos/201',
    'https://picsum.photos/202',
    'https://picsum.photos/203',
  ];

  final List<String> _productNames = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
  ];

  final List<String> _productPrices = [
    '\$120.00',
    '\$150.00',
    '\$180.00',
    '\$210.00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: AppColor.purple1,

      appBar: CustomAppbar(
        isnNotification: true,
        ispop: false,
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              // showModalBottomSheet(
              //     context: context,
              //     isScrollControlled: true,
              //     builder: (BuildContext context) {
              //       return Builder(builder: (context) {
              //         return SingleChildScrollView(
              //           child: Padding(
              //             padding: EdgeInsets.only(
              //                 bottom: MediaQuery.of(context).viewInsets.bottom),
              //             child: Container(
              //               decoration: BoxDecoration(
              //                   color: AppColor.purple1,
              //                   borderRadius: BorderRadius.circular(19)),
              //               height: MediaQuery.of(context).size.height / 2,
              //               child: Center(
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: <Widget>[
              //                     HeaderText(
              //                         fontSize: 22,
              //                         fontWeight: FontWeight.w600,
              //                         text: "enter first and end date:"),
              //                     sizedBox30(),
              //                     StatefulBuilder(builder: (context, setState) {
              //                       return Column(
              //                         children: [
              //                           Padding(
              //                             padding: const EdgeInsets.all(22.0),
              //                             child: myTextFieldDate(
              //                                 suffixIcon: InkWell(
              //                                     onTap: () async {
              //                                       DateTime? date =
              //                                           await showDatePicker(
              //                                               context: context,
              //                                               firstDate:
              //                                                   DateTime(1990),
              //                                               lastDate:
              //                                                   DateTime(2025));
              //                                       if (date == null) {
              //                                         return;
              //                                       }
              //                                       setState(
              //                                         () {
              //                                           sDate.text =
              //                                               "${date.year}/${date.month}/${date.day}";
              //                                         },
              //                                       );
              //                                     },
              //                                     child:
              //                                         Icon(Icons.date_range)),
              //                                 hintName: "start date",
              //                                 hintStyle: TextStyle(
              //                                     color: AppColor.grey1),
              //                                 fillColor: AppColor.white,
              //                                 circular: 25,
              //                                 nameController: sDate,
              //                                 readOnly: false),
              //                           ),
              //                           Padding(
              //                             padding: const EdgeInsets.all(22.0),
              //                             child: myTextFieldDate(
              //                                 suffixIcon: InkWell(
              //                                     onTap: () async {
              //                                       DateTime? date =
              //                                           await showDatePicker(
              //                                               context: context,
              //                                               firstDate:
              //                                                   DateTime(1990),
              //                                               lastDate:
              //                                                   DateTime(2025));
              //                                       if (date == null) {
              //                                         return;
              //                                       }
              //                                       setState(
              //                                         () {
              //                                           lDate.text =
              //                                               "${date.year}/${date.month}/${date.day}";
              //                                         },
              //                                       );
              //                                     },
              //                                     child:
              //                                         Icon(Icons.date_range)),
              //                                 hintName: "last date",
              //                                 hintStyle: TextStyle(
              //                                     color: AppColor.grey1),
              //                                 fillColor: AppColor.white,
              //                                 circular: 25,
              //                                 nameController: lDate,
              //                                 readOnly: false),
              //                           ),
              //                         ],
              //                       );
              //                     }),
              //                     sizedBox30(),
              //                     Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceAround,
              //                       children: [
              //                         MyButton(
              //                             title: "accept",
              //                             onpress: () async {
              //                               // Request storage permission
              //                               if (await Permission
              //                                   .manageExternalStorage
              //                                   .request()
              //                                   .isGranted) {
              //                                 var response =
              //                                     await purchaseServiceImpl()
              //                                         .createReport(
              //                                             DateReportModel(
              //                                                 toDate:
              //                                                     sDate.text,
              //                                                 fromDate:
              //                                                     lDate.text));
              //                                 saveFile(response,
              //                                     "warehouse report.pdf");
              //                                 print(response);
              //                                 if (response != "false") {
              //                                   ScaffoldMessenger.of(context)
              //                                       .showSnackBar(
              //                                     SnackBar(
              //                                       duration:
              //                                           Duration(seconds: 22),
              //                                       backgroundColor:
              //                                           AppColor.green2,
              //                                       content: SizedBox(
              //                                         height: 50,
              //                                         child: Center(
              //                                           child: SubTitle3(
              //                                               text:
              //                                                   "تم تنزيل الملف بنجاح "),
              //                                         ),
              //                                       ),
              //                                     ),
              //                                   );
              //                                 }
              //                               } else {
              //                                 ScaffoldMessenger.of(context)
              //                                     .showSnackBar(SnackBar(
              //                                         duration:
              //                                             Duration(seconds: 3),
              //                                         backgroundColor:
              //                                             AppColor.green2,
              //                                         content: SizedBox(
              //                                           height: 50,
              //                                           child: Center(
              //                                               child: SubTitle3(
              //                                                   text:
              //                                                       "تم إلغاء إعطاء الإذن")),
              //                                         )));
              //                                 print(
              //                                     "Storage permission denied");
              //                               }
              //                             },
              //                             colors: AppColor.green2,
              //                             width: MediaQuery.of(context)
              //                                     .size
              //                                     .width /
              //                                 3,
              //                             height: 44,
              //                             radius: 9),
              //                         MyButton(
              //                             title: "cancel",
              //                             onpress: () {
              //                               Navigator.pop(context);
              //                             },
              //                             colors: AppColor.red,
              //                             width: MediaQuery.of(context)
              //                                     .size
              //                                     .width /
              //                                 3,
              //                             height: 44,
              //                             radius: 9),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       });
              //     });
            },
            child: Text(
              ' The Most Selling :',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 220,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemCount: _productImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 30),
                        child: Card(
                          color: AppColor.pink,
                          elevation: 5,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/images/Rectangle (4).png',
                                // height: 100,
                                // width: 100,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 8),
                                  Text(
                                    _productNames[index],
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _productPrices[index],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'quantity:1200',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                DotsIndicator(
                  dotsCount: 4,
                  position: _currentPage,
                  decorator: DotsDecorator(
                    activeColor: AppColor.purple4,
                    color: AppColor.grey1,
                    size: const Size(8, 8),
                    spacing: const EdgeInsets.all(4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            ' Shipping activity :',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
          ),
          Expanded(
              child: ListView(
            children: [
              WidgetShips(
                image: 'assets/images/car.png',
                title: '200 Ships',
                subTitle: 'This Ship Has Sent',
              ),
              WidgetShips(
                image: 'assets/images/icon reciv.png',
                title: '333 Ships',
                subTitle: 'This Ship Has Recived',
              ),
              WidgetShips(
                image: 'assets/images/icon packg.png',
                title: '111 Ships',
                subTitle: 'This Ship is packging',
              ),
              WidgetShips(
                image: 'assets/images/car.png',
                title: '200 Ships',
                subTitle: 'This Ship Has Sent',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
