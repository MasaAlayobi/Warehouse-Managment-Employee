import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/view/customer.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/addCustomer.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/editCustomer.dart';

class MapPage extends StatefulWidget {
  bool isEdit;
  MapPage({super.key, required this.isEdit});
  @override
  State<MapPage> createState() => _MapPageState();
}

bool isEdit = false;

LatLng _latLng = LatLng(33.51020000, 36.29128000);

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppbar(isnNotification: false, title: "location", ispop: true),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            // onPointerDown: (event, point) {
            onTap: (tapPosition, point) {
              print(point);

              setState(() {
                _latLng = point;
              });
              // },
            },
            initialCenter: _latLng,
            initialZoom: 10,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: _latLng,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyButton(
                  title: "save",
                  onpress: () {
                    widget.isEdit
                        ? Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                            builder: (context) => EditDetailCustomer(
                              latLng: _latLng,
                            ),
                          ))
                        : Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(
                            builder: (context) => AddDetailCustomer(
                              latlng: _latLng,
                            ),
                          ));
                  },
                  colors: AppColor.purple4.withOpacity(0.9),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 15,
                  radius: 12),
            ))
      ]),
    );
  }
}
