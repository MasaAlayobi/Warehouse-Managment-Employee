import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/cardOfProduct.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myContainer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/addItemInventory.dart';
import 'package:mobile_warehouse_managment/core/data/storeItemInWH.dart';
import 'package:mobile_warehouse_managment/core/data/viacles.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/productOfWareWithDetails/bloc/products_in_ware_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/productOfWareWithDetails/detailsOfProduct/view/viewDetailPriduct.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/widget/ShowMBSInware.dart';
import 'package:mobile_warehouse_managment/feature/quality/widget/SMBSinquality.dart';

class ProductInWares extends StatelessWidget {
  int id;
  ProductInWares({super.key, required this.id});
  TextEditingController search = TextEditingController();
  bool isAllProduct = true;
  dynamic _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController min = TextEditingController();
    TextEditingController available = TextEditingController();
    TextEditingController real = TextEditingController();
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
                child: StatefulBuilder(builder: (context, setState) {
                  return Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 15, right: 15, top: 20, bottom: 20),
                      //   child: CustomTextField(
                      //       nameText: 'search',
                      //       nameController: search,
                      //       readOnly: false),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(left: 19, bottom: 1),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: HeaderText(
                              text: "Veicles: ",
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      state.listProductInWareInState.vehciles.isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height / 3.1,
                              child: PageView.builder(
                                onPageChanged: (page) {
                                  setState(() {
                                    _currentPage = page;
                                  });
                                },
                                itemCount: state
                                    .listProductInWareInState.vehciles.length,
                                itemBuilder: (context, index) {
                                  return FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3.4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Card(
                                          color: AppColor.white,
                                          elevation: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 13.0, right: 13),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    state.listProductInWareInState
                                                                .items[index].photo !=
                                                            null
                                                        ? Image.network(
                                                            '${AppUrl.UrlPhoto}${state.listProductInWareInState.items[index].photo}',
                                                            // width: MediaQuery.of(context).size.width / 4,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4,
                                                            errorBuilder:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Image
                                                                  .asset(
                                                                'assets/images/no_photo.png',
                                                                // width: MediaQuery.of(context).size.width / 4,
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    4,
                                                              );
                                                            },
                                                          )
                                                        : Image.asset(
                                                            'assets/images/no_photo.png',
                                                            // width: MediaQuery.of(
                                                            //             context)
                                                            //         .size
                                                            //         .width /
                                                            //     4,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                4,
                                                          ),
                                                    myContainer(
                                                      borderRaduis:
                                                          BorderRadius.circular(
                                                              12),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              251,
                                                              241,
                                                              151),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              11,
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromRGBO(
                                                              247, 226, 33, 1)),
                                                      myWidget: Text(
                                                        "  status: \n${state.listProductInWareInState.vehciles[index].status}",
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                VerticalDivider(
                                                  endIndent: 22,
                                                  indent: 22,
                                                  color: AppColor.purple2,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      maxLines: 3,
                                                      " name: ${state.listProductInWareInState.vehciles[index].name}",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Text(
                                                      "size : ${state.listProductInWareInState.vehciles[index].size_cubic_meters}",
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
                            )
                          : SizedBox(
                              height: 100, child: Text("No veicles to show ")),
                      state.listProductInWareInState.vehciles.length > 0
                          ? DotsIndicator(
                              dotsCount: state
                                  .listProductInWareInState.vehciles.length,
                              position: _currentPage,
                              decorator: DotsDecorator(
                                activeColor: AppColor.purple4,
                                color: AppColor.grey1,
                                size: const Size(8, 8),
                                spacing: const EdgeInsets.all(4),
                              ),
                            )
                          : Text(""),
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
                                  context.read<ProductsInWareBloc>().add(
                                      GetAllProductsInWare(
                                          id: state
                                              .listProductInWareInState.id));
                                },
                              ),
                              DropdownMenuItem<String>(
                                value: 'Low stock products',
                                child: const Text('Low stock products'),
                                onTap: () {
                                  setState(() {
                                    isAllProduct = false;
                                  });
                                  context.read<ProductsInWareBloc>().add(
                                      GetAllProductsInWare(
                                          id: state
                                              .listProductInWareInState.id));
                                },
                              ),
                            ],
                            iconEnabledColor: AppColor.purple4,
                            menuWidth: 188,
                            onChanged: (value) {
                              print(value);
                              print(isAllProduct);
                            },
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
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.55,
                            mainAxisSpacing: 22,
                            crossAxisSpacing: 22),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.listProductInWareInState.items.length,
                        itemBuilder: (context, index) {
                          if (isAllProduct == false) {
                            if (num.parse(state.listProductInWareInState
                                    .items[index].real_qty
                                    .toString()) <=
                                num.parse(state.listProductInWareInState
                                    .items[index].min_qty
                                    .toString())) {
                              return CardOfProduct(
                                  onTapCard: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          ProductDetailsInWareView(
                                              product: state
                                                  .listProductInWareInState
                                                  .items[index]),
                                    ));
                                  },
                                  name: state.listProductInWareInState
                                      .items[index].name,
                                  onTap: () async {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) => BlocProvider(
                                        create: (context) =>
                                            ProductsInWareBloc(),
                                        child: ShowMBSInware(
                                            onTapEdit: () async {
                                              if (real.text.isNotEmpty &&
                                                  available.text.isNotEmpty &&
                                                  min.text.isNotEmpty) {
                                                var temp = await InventoryServiceImpl()
                                                    .updateItemInWare(
                                                        storeItemInWHModel(
                                                            warehouse_id: state
                                                                .listProductInWareInState
                                                                .id,
                                                            min_quantity:
                                                                num.parse(
                                                                    min.text),
                                                            available_quantity:
                                                                num.parse(
                                                                    available
                                                                        .text),
                                                            real_quantity:
                                                                num.parse(
                                                                    real.text)),
                                                        state
                                                            .listProductInWareInState
                                                            .items[index]
                                                            .id);
                                                try {
                                                  if (temp == true) {
                                                    context
                                                        .read<
                                                            ProductsInWareBloc>()
                                                        .add(GetAllProductsInWare(
                                                            id: state
                                                                .listProductInWareInState
                                                                .id));
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.green,
                                                            content: Text(
                                                                'quantities update successfully')));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                Colors.red,
                                                            content: Text(
                                                                'sorry, failed update quantities ,try again please')));
                                                  }
                                                } catch (e) {
                                                  throw e;
                                                }
                                              } else {
                                                Navigator.of(context).pop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        backgroundColor:
                                                            Colors.red,
                                                        content: Text(
                                                            'please,fill all values')));
                                              }
                                            },
                                            realQuantityController: real,
                                            availableQantityController:
                                                available,
                                            minQuantityController: min),
                                      ),
                                    );
                                  },
                                  image: state.listProductInWareInState
                                              .items[index].photo !=
                                          null
                                      ? Image.network(
                                          '${AppUrl.UrlPhoto}${state.listProductInWareInState.items[index].photo}',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              'assets/images/no_photo.png',
                                              // width: MediaQuery.of(context)
                                              //         .size
                                              //         .width /
                                              //     4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  4,
                                            );
                                          },
                                        )
                                      : Image.asset(
                                          'assets/images/no_photo.png',
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                        ),
                                  textOfButtom: "Edit quantity",
                                  price: state.listProductInWareInState
                                      .items[index].sell_price,
                                  sku: state.listProductInWareInState
                                      .items[index].SKU);
                            }
                          } else {
                            return CardOfProduct(
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
                                onTap: () async {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => ShowMBSInware(
                                        onTapEdit: () async {
                                          if (real.text.isNotEmpty &&
                                              available.text.isNotEmpty &&
                                              min.text.isNotEmpty) {
                                            var temp = await InventoryServiceImpl()
                                                .updateItemInWare(
                                                    storeItemInWHModel(
                                                        warehouse_id: state
                                                            .listProductInWareInState
                                                            .id,
                                                        min_quantity:
                                                            num.parse(min.text),
                                                        available_quantity:
                                                            num.parse(
                                                                available.text),
                                                        real_quantity:
                                                            num.parse(
                                                                real.text)),
                                                    state
                                                        .listProductInWareInState
                                                        .items[index]
                                                        .id);
                                            // try {
                                            if (temp == true) {
                                              Navigator.of(context).pop();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      content: Text(
                                                          'quantities update successfully')));
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductInWares(id: id),
                                              ));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      content: Text(
                                                          'sorry, failed update quantities ,try again please')));
                                            }
                                            // } catch (e) {
                                            //   throw e;
                                            // }
                                          } else {
                                            Navigator.of(context).pop();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor: Colors.red,
                                                    content: Text(
                                                        'please,fill all values')));
                                          }
                                        },
                                        realQuantityController: real,
                                        availableQantityController: available,
                                        minQuantityController: min),
                                  );
                                },
                                image: state.listProductInWareInState
                                            .items[index].photo !=
                                        null
                                    ? Image.network(
                                        '${AppUrl.UrlPhoto}${state.listProductInWareInState.items[index].photo}',
                                        // width:
                                        //     MediaQuery.of(context).size.width /
                                        //         4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/no_photo.png',
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width /
                                            //     4,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                4,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/images/no_photo.png',
                                        // width:
                                        //     MediaQuery.of(context).size.width /
                                        //         4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                4,
                                      ),
                                textOfButtom: "Edit quantity",
                                price: state.listProductInWareInState
                                    .items[index].sell_price,
                                sku: state
                                    .listProductInWareInState.items[index].SKU);
                          }
                        },
                      ),
                      sizedBox15()
                    ],
                  );
                }),
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
