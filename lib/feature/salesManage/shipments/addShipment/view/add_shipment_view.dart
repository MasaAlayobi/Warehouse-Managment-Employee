import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/widget/vehicle_choice_widget.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/widget/warehouse_choice_widget.dart';

class AddShipmentView extends StatefulWidget {
  const AddShipmentView({super.key});

  @override
  State<AddShipmentView> createState() => _AddShipmentViewState();
}

class _AddShipmentViewState extends State<AddShipmentView> {
  num? warehouseId1=1;
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
          backgroundColor: AppColor.purple1,
          appBar: CustomAppbar(
            ispop: true,
            isnNotification: false,
            title: "Add Shipment",
          ),
          body: Column(
               children: [
                SizedBox(height: 30,),
                HeaderText(
                                            text: 'Please enter in order '
                                                ,
                                            fontSize: 16,
                                            textcolor: AppColor.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                SizedBox(height: 30,),
                 Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12),
                                child: WarehouseChoiceWidget(
                                  onDataChanged: updatewarehouseId1,
                                  // variable: true,
                                  widget: Text(""),
                                  text1: "Choose warehouse",
                                  // text2: "دمشق",
                                  // text3: "ركن الدين",
                                )),
                                SizedBox(height: 30,),
                 Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12),
                                child: VehicleChoiceWidget(
                                  id:warehouseId1! ,
                                  onDataChanged: updatevehcileId,
                                  // variable: true,
                                  widget: Text(""),
                                  text1: "Choose vehicle",
                                  // text2: "دمشق",
                                  // text3: "ركن الدين",
                                )),
               ],
          ),
    );
  }
}