import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/config/widget/oneNestedExpansionTile.dart';
import 'package:mobile_warehouse_managment/core/config/widget/widget_ships.dart';
import 'package:mobile_warehouse_managment/core/data/storeItemInWH.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/bloc/login_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/showWare/bloc/warehouses_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/widget/widget_warehouse.dart';

class AdditemtowareView extends StatelessWidget {
  AdditemtowareView({super.key, required this.idItem});
  TextEditingController min = TextEditingController();
  TextEditingController real = TextEditingController();
  TextEditingController available = TextEditingController();
  int? selectedWare;
  int idItem;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarehousesBloc()..add(GetAllWarehouses()),
      child: Scaffold(
        backgroundColor: AppColor.purple1,
        drawer: CustomDrawer(),
        appBar: CustomAppbar(
          isnNotification: false,
          title: 'products',
          ispop: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  ' fill this information :',
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.w800),
                ),
              ),
              sizedBox40(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width / 2.5,
                  child: myTextFieldNumber(
                      ReadeOnly: false,
                      phoneText: "real quantity",
                      labelText: "real quantity",
                      phoneController: real),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width / 2.5,
                  child: myTextFieldNumber(
                      ReadeOnly: false,
                      phoneText: "available quantity",
                      labelText: "available quantity",
                      phoneController: available),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: myTextFieldNumber(
                    ReadeOnly: false,
                    phoneText: "min quantity",
                    labelText: "min quantity",
                    phoneController: min),
              ),
              SizedBox(
                height: 8,
              ),
              StatefulBuilder(builder: (context, set) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myNestedExpansionTile(
                      text1:
                          "select warehouse :${selectedWare == null ? "" : "No:${selectedWare}"}",
                      children: [
                        BlocBuilder<WarehousesBloc, WarehousesState>(
                          builder: (context, state) {
                            if (state is SuccessGetWarehouses) {
                              return ListView.separated(
                                  separatorBuilder: (context, index) => Divider(
                                        color: AppColor.purple3,
                                        endIndent: 22,
                                        indent: 22,
                                      ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: state.listWarehouseInState.length,
                                  itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          set(() {
                                            selectedWare = state
                                                .listWarehouseInState[index].id;
                                          });
                                          print(selectedWare);
                                        },
                                        child: ListTile(
                                          title: Text(
                                            '${state.listWarehouseInState[index].name}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          subtitle: Text(
                                            "${state.listWarehouseInState[index].location}",
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ));
                            } else if (state is EmptyGetWarehouse) {
                              return Center(
                                child: Column(
                                  children: [
                                    Lottie.asset("assets/lottie/empty.json",
                                        width: 200, height: 333),
                                    Text("Empty"),
                                  ],
                                ),
                              );
                            } else if (state is LoadedGetWarehouse) {
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
                      ]),
                );
              }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    myButtonWithBorder(
                        fillColor: AppColor.green1,
                        onTap: () async {
                          try {
                            var response = await InventoryServiceImpl()
                                .addItemToWarehouse(
                                    idItem,
                                    storeItemInWHModel(
                                        warehouse_id: selectedWare,
                                        min_quantity: num.parse(min.text),
                                        available_quantity:
                                            num.parse(available.text),
                                        real_quantity: num.parse(real.text)));
                            print(response);
                            print(storeItemInWHModel(
                                warehouse_id: selectedWare,
                                min_quantity: num.parse(min.text),
                                available_quantity: num.parse(available.text),
                                real_quantity: num.parse(real.text)));

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(response.toString()),
                              backgroundColor: AppColor.green2,
                            ));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                              backgroundColor: AppColor.red,
                            ));
                          }
                        },
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        border: Border.all(color: AppColor.green2),
                        radius: 11,
                        text: "save",
                        textColor: AppColor.black,
                        fontsize: 15,
                        fontWeight: FontWeight.w300),
                    myButtonWithBorder(
                        fillColor: const Color.fromARGB(255, 246, 168, 168),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        height: MediaQuery.of(context).size.height / 15,
                        width: MediaQuery.of(context).size.width / 2.5,
                        border: Border.all(color: AppColor.red),
                        radius: 11,
                        text: "cancel",
                        textColor: AppColor.black,
                        fontsize: 15,
                        fontWeight: FontWeight.w300)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
