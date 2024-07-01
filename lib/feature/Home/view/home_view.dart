import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_button.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/widget_ships.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';

GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

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
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: AppColor.purple1,
      appBar: CustomAppbar(isnNotification: true,),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ' The Most Selling :',
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
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
            WidgetShips(image: 'assets/images/car.png',title: '200 Ships',subTitle: 'This Ship Has Sent',),
            WidgetShips(image: 'assets/images/icon reciv.png',title: '333 Ships',subTitle: 'This Ship Has Recived',),
            WidgetShips(image: 'assets/images/icon packg.png',title: '111 Ships',subTitle: 'This Ship is packging',),
            WidgetShips(image: 'assets/images/car.png',title: '200 Ships',subTitle: 'This Ship Has Sent',),
            ],
          )),
        ],
      ),
    );
  }
}


