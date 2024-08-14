import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/bloc/all_current_sale_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/currentOrder/widget/widget_new_order.dart';

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCurrentSaleOrderBloc(),
      child: Builder(builder: (context) {
        context.read<AllCurrentSaleOrderBloc>().add(GetAllCurrentSaleOrder());
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: CustomAppbar(
            isnNotification: false,
            ispop: true,
            title: 'New orders',
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text('    Orders :',
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                      color: AppColor.black)),
              SizedBox(
                height: 10,
              ),
              Expanded(child: BlocBuilder<AllCurrentSaleOrderBloc, AllCurrentSaleOrderState>(
                builder: (context, state) {
                  if(state is SuccessfetchOrder){
                    return ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      return WidgetNewOrder(order: state.orders[index],);
                    },
                  );
                  }
                  else if (state is NoConnection) {
              return RefreshIndicator(
                onRefresh: () async {
                  print("object");
                  context.read<AllCurrentSaleOrderBloc>().add(GetAllCurrentSaleOrder());
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
                  context.read<AllCurrentSaleOrderBloc>().add(GetAllCurrentSaleOrder());
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
              ))
            ],
          ),
          floatingActionButton: Align(
            alignment: Alignment(0.9, 0.97),
            child: FloatingActionButton(
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                  size: 35,
                ),
                backgroundColor: AppColor.purple4,
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kAddOrderSaleView);
                }),
          ),
        );
      }),
    );
  }
}
