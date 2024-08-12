import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/domain/customer_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/bloc/customers_bloc.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/addCustomer.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/detailsClient/view/detailsCustomer.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/detailSupplier.dart';

import '../../../../core/config/widget/custom_drawer.dart';

class Customer extends StatelessWidget {
  Customer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomersBloc()..add(getCustomers()),
      child: Builder(builder: (context) {
        return SafeArea(
            child: Scaffold(
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddDetailCustomer(),
              ));
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: AppColor.purple4,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Icon(
                  Icons.person_add_alt_outlined,
                  color: AppColor.white,
                  size: 33,
                ),
              ),
            ),
          ),
          drawer: CustomDrawer(),
          backgroundColor: AppColor.purple1,
          appBar: CustomAppbar(
            ispop: true,
            isnNotification: false,
            title: "Customers",
          ),
          body: BlocBuilder<CustomersBloc, CustomersState>(
            builder: (context, state) {
              if (state is SuccessGetCustomers) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: HeaderText(
                        text: "  All customers:",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        textcolor: AppColor.black,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.customersList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailCustomer(
                                  id: state.customersList[index].id,
                                ),
                              ));
                            },
                            child: Dismissible(
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
                              key: Key(state.customersList[index].toString()),
                              confirmDismiss: (direction) async {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Confirm Deletion"),
                                    content: Text(
                                        "Are you sure you want to delete this item?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          var response =
                                              await CustomerServiceImpl()
                                                  .deleteCustomer(state
                                                      .customersList[index].id);
                                          if (response == true) {
                                            Navigator.of(context).pop(false);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(new SnackBar(
                                              content:
                                                  Text("success to delete"),
                                              backgroundColor: AppColor.green2,
                                            ));
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) => Customer(),
                                            ));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(new SnackBar(
                                              content:
                                                  Text("failed to delete "),
                                              backgroundColor: AppColor.red,
                                            ));
                                          }
                                        },
                                        child: Text("Delete"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text("Cancel"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 10, 15, 0),
                                child: SizedBox(
                                  // height: MediaQuery.of(context).size.height / 6,
                                  child: Card(
                                    color: AppColor.white,
                                    elevation: 13,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, top: 5, bottom: 5),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                color: AppColor.white),
                                            child: Image.asset(
                                              'assets/images/img.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              30,
                                        ),
                                        VerticalDivider(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            // mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                state.customersList[index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: Text(
                                                  softWrap: true,
                                                  maxLines: 3,
                                                  // overflow: TextOverflow.fade,
                                                  " ${state.customersList[index].email.toString()}",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2.5,
                                                child: Text(
                                                  softWrap: true,
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  "${state.customersList[index].location}",
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
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
                  ],
                );
              } else if (state is EmptyGetCustomers) {
                return Center(
                  child: Column(
                    children: [
                      Lottie.asset("assets/lottie/empty.json",
                          width: 200, height: 333),
                      Text("Empty"),
                    ],
                  ),
                );
              } else if (state is LoadedGetCustomers) {
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
              return Center(child: Text("try again latter"));
            },
          ),
        ));
      }),
    );
  }
}
