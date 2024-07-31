import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/cardOfProduct.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myContainer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/viacles.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/productOfWareWithDetails/bloc/products_in_ware_bloc.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/productOfWareWithDetails/detailsOfProduct/view/viewDetailPriduct.dart';

class ProductInWares extends StatelessWidget {
  int id;
  ProductInWares({super.key, required this.id});
  TextEditingController search = TextEditingController();
  bool isAllProduct = true;
  dynamic _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsInWareBloc()..add(GetAllProductsInWare(id: id)),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.purple1,
        drawer: CustomDrawer(),
        appBar: CustomAppbar(
            isnNotification: false, title: "Warehouse's datails", ispop: true),
        body: BlocBuilder<ProductsInWareBloc, ProductsInWareState>(
          builder: (context, state) {
            if (state is SuccessGetProducts) {
              // List.generate(state.listProductInWareInState.vehciles.length, (index) => ViaclesInWareModel.fromMap(state.listProductInWareInState.vehciles[index]),);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, top: 20, bottom: 20),
                      child: CustomTextField(
                          nameText: 'search',
                          nameController: search,
                          readOnly: false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 19, bottom: 19),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: HeaderText(
                            text: "Veicles: ",
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    StatefulBuilder(builder: (context, setState) {
                      return SizedBox(
                        height: 200,
                        child: PageView.builder(
                          onPageChanged: (page) {
                            setState(() {
                              _currentPage = page;
                            });
                            print(_currentPage);
                          },
                          itemCount:
                              state.listProductInWareInState.vehciles.length,
                          itemBuilder: (context, index) {
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 4,
                                child: Padding(
                                  padding: const EdgeInsets.all(22),
                                  child: Card(
                                    color: AppColor.white,
                                    elevation: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13.0, right: 13),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image.asset(
                                                'assets/images/car.png',
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    18,
                                                width: 77,
                                              ),
                                              myContainer(
                                                borderRaduis:
                                                    BorderRadius.circular(12),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3,
                                                color: const Color.fromARGB(
                                                    255, 251, 241, 151),
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    22,
                                                border: Border.all(
                                                    color: const Color.fromRGBO(
                                                        247, 226, 33, 1)),
                                                myWidget: Text(
                                                  "status: ${state.listProductInWareInState.vehciles[index].status}",
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 8),
                                              Text(
                                                "viecle's name: ${state.listProductInWareInState.vehciles[index].name}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "size m*m: ${state.listProductInWareInState.vehciles[index].size_cubic_meters}",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'capacity weight: ${state.listProductInWareInState.vehciles[index].load_capacity_kg} Kg',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              sizedBox40(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 5),
                    Text(_currentPage.toString()),
                    DotsIndicator(
                      dotsCount: state.listProductInWareInState.vehciles.length,
                      position: _currentPage,
                      decorator: DotsDecorator(
                        activeColor: AppColor.purple4,
                        color: AppColor.grey1,
                        size: const Size(8, 8),
                        spacing: const EdgeInsets.all(4),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => Row(
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
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          mainAxisSpacing: 22,
                          crossAxisSpacing: 0),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.listProductInWareInState.items.length,
                      itemBuilder: (context, index) {
                        return isAllProduct == true
                            ? CardOfProduct(
                                onTapCard: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsInWareView(
                                            product: state
                                                .listProductInWareInState
                                                .items[index]),
                                  ));
                                },
                                name: state
                                    .listProductInWareInState.items[index].name,
                                onTap: () {},
                                image: Image.asset(
                                  "assets/images/Rectangle (4).png",
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  // width: MediaQuery.of(context).size.width / 1.1,
                                ),
                                textOfButtom: "Edit quantity",
                                price: state.listProductInWareInState
                                    .items[index].sell_price,
                                sku: state
                                    .listProductInWareInState.items[index].SKU)
                            : CardOfProduct(
                                onTapCard: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsInWareView(
                                            product: state
                                                .listProductInWareInState
                                                .items[index]),
                                  ));
                                },
                                name: state
                                    .listProductInWareInState.items[index].name,
                                onTap: () {},
                                image: Image.asset(
                                  "assets/images/Rectangle (4).png",
                                  fit: BoxFit.fill,
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  // width: MediaQuery.of(context).size.width / 1.1,
                                ),
                                textOfButtom: "Edit quantity",
                                price: state.listProductInWareInState
                                    .items[index].sell_price,
                                sku: state
                                    .listProductInWareInState.items[index].SKU);
                      },
                    ),
                  ],
                ),
              );
            } else if (state is EmptyGetProducts) {
              return Center(
                child: Column(
                  children: [
                    Lottie.asset("assets/lottie/empty.json",
                        width: 200, height: 333),
                    Text("Empty")
                  ],
                ),
              );
            } else if (state is LoadedGetProducts) {
              return Center(
                child: Column(
                  children: [
                    Lottie.asset("assets/lottie/loading.json",
                        width: 200, height: 333),
                    Text("Loading..."),
                  ],
                ),
              );
            }
            return Text("try again latter");
          },
        ),
      )),
    );
  }
}
