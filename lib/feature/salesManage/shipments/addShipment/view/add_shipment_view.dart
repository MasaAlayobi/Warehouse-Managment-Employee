import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButtonWithBorder.dart';
import 'package:mobile_warehouse_managment/core/data/add_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/addOrder/bloc/add_order_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/bloc/add_shipment_bloc.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/widget/choose_driver_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/widget/vehicle_choice_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/widget/warehouse_choice_widget.dart';

class AddShipmentView extends StatefulWidget {
  const AddShipmentView({super.key});

  @override
  State<AddShipmentView> createState() => _AddShipmentViewState();
}

class _AddShipmentViewState extends State<AddShipmentView> {
  num? warehouseId1 = 1;
  num? vehcileId1;
  void updatevehcileId(num vehcileId) {
    setState(() {
      vehcileId1 = vehcileId;
    });
  }

  void updatewarehouseId1(num warehouseId) {
    setState(() {
      warehouseId1 = warehouseId;
    });
  }

  num? driverId = 1;
  void updateDriverId1(num driverId1) {
    setState(() {
      driverId = driverId1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddShipmentBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            drawer: CustomDrawer(),
            backgroundColor: AppColor.purple1,
            appBar: CustomAppbar(
              ispop: true,
              isnNotification: false,
              title: "Add Shipment",
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: 10,
                      // ),
                      Icon(
                        Icons.error,
                        color: AppColor.red,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        height: 40,
                        width: 200,
                        decoration:
                            BoxDecoration(border: Border.all(color: AppColor.red)),
                        child: Center(
                          child: HeaderText(
                            text: 'Please enter in order  :',
                            fontSize: 16,
                            textcolor: AppColor.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  HeaderText(
                    text: '   Choose warehouse  :',
                    fontSize: 16,
                    textcolor: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: WarehouseChoiceWidget(
                        onDataChanged: updatewarehouseId1,
                        // variable: true,
                        widget: Text(""),
                        text1: "Choose warehouse",
                        // text2: "دمشق",
                        // text3: "ركن الدين",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  HeaderText(
                    text: '   Choose vehicle  :',
                    fontSize: 16,
                    textcolor: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: VehicleChoiceWidget(
                        id: warehouseId1!,
                        onDataChanged: updatevehcileId,
                        // variable: true,
                        widget: Text(""),
                        text1: "Choose vehicle",
                        // text2: "دمشق",
                        // text3: "ركن الدين",
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  HeaderText(
                    text: '   Choose driver  :',
                    fontSize: 16,
                    textcolor: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //  SizedBox(height: 30,),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ChooseDriverWidget(
                        onDataChanged: updateDriverId1,
                        // variable: true,
                        widget: Text(""),
                        text1: " Driver :",
                        // text2: "دمشق",
                        // text3: "ركن الدين",
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  BlocListener<AddShipmentBloc, AddShipmentState>(
                    listener: (context, state) {
                      if (state is SuccessAddShipment) {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kAllShipmentsView);
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text(state.message),
                          backgroundColor: AppColor.blue1,
                        ));
                      } else if (state is NotAddedShipment) {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                          content: Text(state.message),
                          backgroundColor: AppColor.red,
                        ));
                      }
                    },
                    child: Center(
                      child: myButtonWithBorder(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2.8,
                          fillColor: AppColor.blue2,
                          onTap: () {
                            AddShipmentModel shipment = AddShipmentModel(employee_id: driverId!.toInt(), vehicle_id: vehcileId1!.toInt(), warehouse_id: warehouseId1!.toInt());
                            context
                                .read<AddShipmentBloc>()
                                .add(AddShipment(shipment: shipment));
                          },
                          border: Border.all(color: AppColor.blue1),
                          radius: 12,
                          text: "Add",
                          textColor: AppColor.black,
                          fontsize: 17,
                          // width:
                          //     MediaQuery.of(context).size.width / 2.8,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
