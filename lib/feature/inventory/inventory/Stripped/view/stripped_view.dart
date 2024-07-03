import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/widget/widget_product_stripped.dart';

class StrippedView extends StatefulWidget {
  const StrippedView({super.key});

  @override
  State<StrippedView> createState() => _StrippedViewState();
}

class _StrippedViewState extends State<StrippedView> {
  late bool isAllProduct;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isAllProduct = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButton<String>(
                isExpanded: false,
                items: [
                  DropdownMenuItem<String>(
                    value: 'All products',
                    child: const Text('All products'),
                    onTap: () {
                      setState(() {
                        isAllProduct = true;
                      });
                    },
                  ),
                  DropdownMenuItem<String>(
                    value: 'Low stock products',
                    child: const Text('Low stock products'),
                    onTap: () {
                      setState(() {
                        isAllProduct = false;
                      });
                    },
                  ),
                ],
                iconEnabledColor: AppColor.purple4,
                onChanged: (value) {},
                hint: Text(
                    isAllProduct == true
                        ? '    All Product :'
                        : '    Low stock products :',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppColor.black)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 13,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                     GoRouter.of(context).push(AppRouter.kProductDetailsView);
                  },
                  child: isAllProduct == true
                    ? WidgetProductStripped(
                      fillColor: AppColor.white,
                        image: 'assets/images/Rectangle (4).png',
                        title: 'product name',
                        subTitle: "Price :119.99\$",
                        subtitle2: "Quantity:1200",
                      )
                    : WidgetProductStripped(
                      fillColor: AppColor.pink,
                        image: 'assets/images/Rectangle (4).png',
                        title: 'product name',
                        subTitle: "Price :119.99\$",
                        subtitle2: "Quantity:1200",
                      ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment(0.9,0.97),
        child: FloatingActionButton(
          child:Image.asset(
            fit: BoxFit.contain,
            width: 40,
            height: 40,
            'assets/images/addProduct.png',) ,
          backgroundColor:AppColor.purple4,
        
          onPressed: (){
            GoRouter.of(context).push(AppRouter.kAddProductView);
          }),
      ),
    );
  }
}
