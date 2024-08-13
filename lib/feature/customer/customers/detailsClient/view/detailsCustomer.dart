// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextField.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldDate.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldEmail.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/config/widget/my_sized_box.dart';
import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/data/detailsACleint.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/bloc/customers_bloc.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/detailsClient/bloc/detail_of_client_bloc.dart';
import 'package:mobile_warehouse_managment/feature/customer/view/editCustomer.dart';
import 'package:mobile_warehouse_managment/feature/supplier/view/editDetailSupp.dart';

import '../../../../../core/config/widget/myButton.dart';

DetailsacleintModel? detailsAClient;

class DetailCustomer extends StatelessWidget {
  int id;
  DetailCustomer({
    Key? key,
    required this.id,
  }) : super(key: key);
  TextEditingController customer = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController total = TextEditingController();
  TextEditingController debtDate = TextEditingController();
  TextEditingController payDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.purple1,
      drawer: const CustomDrawer(),
      appBar: CustomAppbar(
        title: "Detail's Customer",
        isnNotification: false,
        ispop: true,
      ),
      body: BlocProvider(
        create: (context) =>
            DetailOfClientBloc()..add(getDetailsClient(id: id)),
        child: BlocBuilder<DetailOfClientBloc, DetailOfClientState>(
          builder: (context, state) {
            if (state is SuccessgetDetailsClient) {
              detailsAClient = DetailsacleintModel(
                  id: id,
                  phones: state.detailsClient.phones,
                  email: state.detailsClient.email,
                  name: state.detailsClient.name,
                  location: state.detailsClient.location);
              print(id);
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            height: MediaQuery.of(context).size.height / 6,
                            child: Image.asset(
                              "assets/images/img.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const sizedBox50(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myTextFieldName(
                            label: "customer",
                            nameText: state.detailsClient.name.toString(),
                            nameController: customer,
                            readOnly: true),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myTextFieldEmail(
                            validatorText: (text) {
                              if (text!.isEmpty) {
                                return "required";
                              }
                              final regexp = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (!regexp.hasMatch(text)) {
                                return "write email in correct way";
                              }
                              return " ";
                            },
                            label: "email",
                            colorOfTextField: AppColor.purple2,
                            nameText: state.detailsClient.email.toString(),
                            readOnly: true,
                            radius: 8,
                            email: email),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: myTextFieldName(
                            label: "location",
                            nameText: state.detailsClient.location.toString(),
                            nameController: position,
                            readOnly: true),
                      ),
                      SizedBox(
                          child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.detailsClient.phones.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: myTextFieldNumber(
                            labelText: "phone number ${index + 1}",
                            phoneController: total,
                            ReadeOnly: true,
                            phoneText: state.detailsClient.phones[index]
                                ["number"],
                          ),
                        ),
                      )),
                      const sizedBox15(),
                      MyButton(
                          title: "Edit",
                          onpress: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditDetailCustomer(
                                 ),
                            ));
                          },
                          colors: AppColor.purple3,
                          fontsize: 20,
                          width: MediaQuery.of(context).size.width / 1,
                          height: MediaQuery.of(context).size.height / 15,
                          radius: 12),
                    ],
                  ),
                ),
              );
            } else if (state is LoadedgetDetailsClient) {
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
      ),
    );
  }
}
