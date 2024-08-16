import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/bloc/previous_sale_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/previousSales/widget/widget_shipments_and_orders.dart';

class PreviousSalesView extends StatefulWidget {
  const PreviousSalesView({super.key});

  @override
  State<PreviousSalesView> createState() => _PreviousSalesViewState();
}

class _PreviousSalesViewState extends State<PreviousSalesView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreviousSaleBloc(),
      child: Builder(
        builder: (context) {
           context.read<PreviousSaleBloc>().add(GetAllPreviousSale());
          return Scaffold(
            backgroundColor: AppColor.purple1,
            drawer: CustomDrawer(),
            appBar: CustomAppbar(
              isnNotification: false,
              ispop: true,
              title: 'Previous Sales',
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('  Charges :',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w800,
                        color: AppColor.black)),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<PreviousSaleBloc, PreviousSaleState>(
                  builder: (context, state) {
                   if(state is SuccessFetchPreviousSale){
                     return Expanded(
                        child: ListView.builder(
                      itemCount:state.shipment.length,
                      itemBuilder: (context, index) {
                        return WidgetShipmentsAndOrders(shipment: state.shipment[index],);
                      },
                    ));
                   }else if (state is NoConnection) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      print("object");
                      context.read<PreviousSaleBloc>().add(GetAllPreviousSale());
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
                       context.read<PreviousSaleBloc>().add(GetAllPreviousSale());
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
          );
        }
      ),
    );
  }
}
