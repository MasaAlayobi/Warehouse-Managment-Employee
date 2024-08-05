import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/widget_ships.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/Auth/login/bloc/login_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/showWare/bloc/warehouses_bloc.dart';
import 'package:mobile_warehouse_managment/feature/warehouses/widget/widget_warehouse.dart';

class WarehousesView extends StatelessWidget {
  const WarehousesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WarehousesBloc()..add(GetAllWarehouses()),
      child: Scaffold(
        backgroundColor: AppColor.purple1,
        drawer: CustomDrawer(),
        appBar: CustomAppbar(
          isnNotification: false,
          title: 'Warehouses',
          ispop: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              ' Our Warehouses :',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 44,
            ),
            BlocBuilder<WarehousesBloc, WarehousesState>(
              builder: (context, state) {
                if (state is SuccessGetWarehouses) {
                  print("state is SuccessGetWarehouses");
                  return Expanded(
                      child: ListView.builder(
                          itemCount: state.listWarehouseInState.length,
                          itemBuilder: (context, index) {
                            return WidgetWarehouse(
                              id: state.listWarehouseInState[index].id,
                              image: 'assets/images/warehouse.png',
                              title: state.listWarehouseInState[index].name,
                              subTitle:
                                  'NO:${state.listWarehouseInState[index].id}',
                              position:
                                  state.listWarehouseInState[index].location,
                            );
                          }));
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
            )
          ],
        ),
      ),
    );
  }
}
