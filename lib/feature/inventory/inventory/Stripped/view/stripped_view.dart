import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myFloatingActionButton.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/bloc/items_stripped_bloc.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/Stripped/widget/widget_product_stripped.dart';
import 'package:mobile_warehouse_managment/feature/inventory/inventory/view/inventory_view.dart';
import 'package:mobile_warehouse_managment/feature/inventory/productDetails/view/product_details_view.dart';

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
      body: Builder(builder: (context) {
        context
            .read<ItemsStrippedBloc>()
            .add(GetAllItemInStripped(lable: search.text));
        return BlocConsumer<ItemsStrippedBloc, ItemsStrippedState>(
          listener: (context, state) {
            if (state is SuccessDelete) {}
          },
          builder: (context, state) {
            if (state is SuccessFetchItem) {
              return Column(
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
                      itemCount: state.allProduct.length,
                      itemBuilder: (context, index) {
                        final item = state.allProduct[index];
                        print(
                            '${AppUrl.UrlPhoto}${state.allProduct[index].photo}');
                        return InkWell(
                          onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailsView(item: item,),));
                                                      
                          },
                          child:  Dismissible(
                                  direction: DismissDirection.endToStart,
                                  background: Container(
                                    height: 40,
                                    color: AppColor.red,
                                    child: Icon(
                                      Icons.delete,
                                      color: AppColor.white,
                                      size: 40,
                                    ),
                                  ),
                                  key: Key(item.toString()),
                                  confirmDismiss: (direction) async {
                                    return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              ItemsStrippedBloc(),
                                          child: Builder(builder: (context) {
                                            return BlocListener<ItemsStrippedBloc,
                                                ItemsStrippedState>(
                                              listener: (context, state) {
                                                if(state is SuccessDelete){
                                                   ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            new SnackBar(
                                                                      content:
                                                                          Text(state.message),
                                                                      backgroundColor:
                                                                        AppColor.green2,
                                                                    ));
                                                                    
                                                                    GoRouter.of(
                                                                            context)
                                                                        .pop(true);
                                                }else  if(state is ErrorInDelete){
                                                   ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                            new SnackBar(
                                                                      content:
                                                                          Text(state.message),
                                                                      backgroundColor:
                                                                        AppColor.red,
                                                                    ));
                                                                    GoRouter.of(
                                                                            context)
                                                                        .pop(false);
                                                }
                                              },
                                              child: AlertDialog(
                                                title:
                                                    Text("Confirm Deletion"),
                                                content: Text(
                                                    "Are you sure you want to delete this item?"),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              ItemsStrippedBloc>()
                                                          .add(DeleteItem(
                                                              Id: state
                                                                  .allProduct[
                                                                      index]
                                                                  .id!),

                                                                  );
                                                                  setState(() {
                                                      state.allProduct.removeAt(index);
              });
                                                    },
                                                    child: Text("Delete"),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {

                                                        Navigator.of(context)
                                                            .pop(false);
                                                    },
                                                    child: Text("Cancel"),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  },
                                  child: WidgetProductStripped(
                                    fillColor: AppColor.white,
                                    image:
                                        '${AppUrl.UrlPhoto}${state.allProduct[index].photo}',
                                    title: '${state.allProduct[index].name}',
                                    subTitle:
                                        "Price :${state.allProduct[index].str_price}",
                                    subtitle2:
                                        "Quantity:${state.allProduct[index].total_qty}",
                                  ),
                                )
                              // : WidgetProductStripped(
                              //     fillColor: AppColor.pink,
                              //     image:
                              //         '${AppUrl.UrlPhoto}${state.allProduct[index].photo}',
                              //     title: '${state.allProduct[index].name}',
                              //     subTitle:
                              //         "Price :${state.allProduct[index].str_price}",
                              //     subtitle2:
                              //         "Quantity:${state.allProduct[index].total_qty}",
                              //   ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else if (state is NoConnection) {
              return RefreshIndicator(
                onRefresh: () async {
                  print("object");
                  context
                      .read<ItemsStrippedBloc>()
                      .add(GetAllItemInStripped(lable: search.text));
                },
                child: Center(
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/empty.json",
                          width: 200, height: 333),
                      Text(state.message),
                    ],
                  ),
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<ItemsStrippedBloc>()
                      .add(GetAllItemInStripped(lable: search.text));
                },
                child: Center(
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/loading.json",
                          width: 200, height: 333),
                      Text("Loading..."),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
      floatingActionButton: myFloatingActionButtton(
          image: Image.asset(
            fit: BoxFit.contain,
            width: 40,
            height: 40,
            'assets/images/addProduct.png',
          ),
          onPress: () {
            GoRouter.of(context).push(AppRouter.kAddProductView);
          }),
    );
  }
}
