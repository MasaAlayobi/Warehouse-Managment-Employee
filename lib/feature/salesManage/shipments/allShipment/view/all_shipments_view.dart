import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/view/add_shipment_view.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/bloc/all_shipment_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/widget/shipment_widget.dart';

class AllShipmentsView extends StatelessWidget {
  const AllShipmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        context.read<AllShipmentBloc>().add(GetAllShipment());
        return Scaffold(
          backgroundColor: AppColor.purple1,
          drawer: CustomDrawer(),
          appBar: CustomAppbar(
            isnNotification: false,
            title: 'All Shipments',
            ispop: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8,
              ),
              Text(
                '   All Shipments :',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 15,
              ),
              BlocBuilder<AllShipmentBloc, AllShipmentState>(
                builder: (context, state) {
                  if(state is SuccessFetchAllShipment){
                    return Expanded(
                      child: ListView.builder(
                          itemCount: state.allShipment.length,
                          itemBuilder: (context, index) {
                            return ShipmentWidget(
                              id:state.allShipment[index].id,
                              image: 'assets/images/car.png',
                              title:
                                  'Tracking number : \n${state.allShipment[index].tracking_number}',
                              subTitle: "current_capacity : ${state.allShipment[index].current_capacity}",
                              status: "${state.allShipment[index].status}",
                            );
                          }));
                  }
                  else if (state is NoConnectionWithAllShipment) {
                return RefreshIndicator(
                  onRefresh: () async {
                    print("object");
                    context
                        .read<AllShipmentBloc>()
                        .add(GetAllShipment());
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
                        .read<AllShipmentBloc>()
                        .add(GetAllShipment());
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
          floatingActionButton: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddShipmentView(),
              ));
            },
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  color: AppColor.purple4,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Icon(
                  Icons.add,
                  color: AppColor.white,
                  size: 33,
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
