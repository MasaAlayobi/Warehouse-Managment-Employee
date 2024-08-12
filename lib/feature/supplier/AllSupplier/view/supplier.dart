import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/supplier/AllSupplier/bloc/all_supplier_bloc.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/addSupplier.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/detailSupplier.dart';

import '../../../../core/config/widget/custom_drawer.dart';

class Supplier extends StatelessWidget {
  const Supplier({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllSupplierBloc()..add(GetAllSupplier()),
      child: Builder(builder: (context) {
        return SafeArea(
            child: Scaffold(
          
          drawer: CustomDrawer(),
          backgroundColor: AppColor.purple1,
          appBar: CustomAppbar(
            ispop: false,
            isnNotification: true,
            title: "Suppliers",
          ),
          body: Column(
            children: [
              HeaderText(
                text: "All suppliers:",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textcolor: AppColor.black,
              ),
              BlocBuilder<AllSupplierBloc, AllSupplierState>(
                builder: (context, state) {
                 if(state is SuccessFetchAllSupplier){
                   return Expanded(
                    child: ListView.builder(
                      itemCount: state.allSupplier.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailSupplier(),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height / 7,
                              child: Card(
                                color: AppColor.white,
                                elevation: 13,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                9,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColor.white),
                                        child: Image.asset(
                                            'assets/images/img.png'),
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: MediaQuery.of(context).size.width / 30,
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          state.allSupplier[index].name,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          state.allSupplier[index].location,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          state.allSupplier[index].email,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        // Text(
                                        //   "Date of pay:2009/9/5",
                                        //   style: const TextStyle(
                                        //       fontSize: 14,
                                        //       fontWeight: FontWeight.w600),
                                        // ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                 }  else if (state is NoConnection) {
              return RefreshIndicator(
                onRefresh: () async {
                  print("object");
                  context
                      .read<AllSupplierBloc>()
                      .add(GetAllSupplier());
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
                      .read<AllSupplierBloc>()
                      .add(GetAllSupplier());
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
              )
            ],
          ),
        ));
      }),
    );
  }
}
