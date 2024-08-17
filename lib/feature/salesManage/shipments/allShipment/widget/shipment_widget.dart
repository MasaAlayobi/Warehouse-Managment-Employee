import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/allShipment/bloc/all_shipment_bloc.dart';

class ShipmentWidget extends StatefulWidget {
  ShipmentWidget(
      {super.key,
      this.image,
      this.title,
      this.position,
      required this.id,
      this.status,
      this.subTitle});
  final String? image;
  int id;
  final String? title;
  final String? status;

  final String? subTitle;
  final String? position;

  @override
  State<ShipmentWidget> createState() => _ShipmentWidgetState();
}

bool isAllProduct = true;
String status = '';

class _ShipmentWidgetState extends State<ShipmentWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllShipmentBloc(),
      child: Builder(builder: (context) {
        return BlocListener<AllShipmentBloc, AllShipmentState>(
          listener: (context, state) {
            if (state is SuccessChangeShipmentStatus) {
                                      print(';;;;;;;;;;;;');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: AppColor.green1,
                                      ));
                                          //                               Navigator.pop(
                                          // context);
                                      GoRouter.of(context).pushReplacement(
                                          AppRouter.kAllShipmentsView);
                                    } else if (state is NoConnectionWithChangeShipment) {
                                      print(';;;;;;;;;;;;');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(new SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: AppColor.red,
                                      ));
                                      // GoRouter.of(context).pushReplacement(
                                      //     AppRouter.kCurrentOrderView);
                                      // Navigator.pop(
                                      //     context);
                                    }
          },
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ProductInWares(id: id),
              // ));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: SizedBox(
                height: 160,
                child: Card(
                  color: AppColor.white,
                  elevation: 13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 90,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: AppColor.purple5),
                          child: Image.asset('${widget.image}'),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.red,
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width / 2,

                            child: Center(
                              child: Text(
                                '${widget.title}',
                                maxLines: 4,
                                style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700,
                                  // textBaseline:TextBaseline.alphabetic
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '${widget.subTitle}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Builder(builder: (context) {
                            return Container(
                              width: 180,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColor.blue1),
                                color: AppColor.blue2,
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  isDense: true,
                                  underline: null,
                                  iconEnabledColor: AppColor.blue1,
                                  iconDisabledColor: AppColor.blue1,
                                  focusColor: AppColor.blue2,
                                  dropdownColor: AppColor.blue2,
                                  hint: Container(
                                    child: Text(
                                      'Status : ${widget.status}',
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  onChanged: (value) {},
                                  isExpanded: false,
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: 'sending',
                                      child: const Text('sending'),
                                      onTap: () {
                                        setState(() {
                                          status = 'sending';
                                          print(status);
                                          isAllProduct = true;
                                        });
                                        context
                                            .read<AllShipmentBloc>()
                                            .add(ChangeShipmentStatus(
                                                shipmentId: widget.id,
                                                status: status));
                                      },
                                    ),
                                    DropdownMenuItem<String>(
                                      value: 'received',
                                      child: const Text('received'),
                                      onTap: () {
                                        setState(() {
                                          status = 'received';
                                          print(status);
                                          isAllProduct = true;
                                        });
                                        context
                                            .read<AllShipmentBloc>()
                                            .add(ChangeShipmentStatus(
                                                shipmentId: widget.id,
                                                status: status));
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
