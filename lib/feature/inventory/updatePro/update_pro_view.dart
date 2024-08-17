import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_warehouse_managment/core/config/router/app_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_appbar.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_drawer.dart';
import 'package:mobile_warehouse_managment/core/config/widget/custom_text_field.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myButton.dart';
import 'package:mobile_warehouse_managment/core/data/add_item_in_inventory.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/bloc/add_product_to_inventory_bloc.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_quantity.dart';
import 'package:mobile_warehouse_managment/feature/inventory/addProduct/widget/widget_add_sale.dart';
import 'package:mobile_warehouse_managment/feature/inventory/updatePro/widget_update_sale.dart';
import 'package:mobile_warehouse_managment/feature/inventory/updatePro/widget_upsate_quantity.dart';
import 'package:mobile_warehouse_managment/main.dart';

class AddProductView extends StatefulWidget {
  AddProductView({super.key, required this.item});
 final ItemInStripped item;
  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  String? selectedTitle;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
    selectedTitle = 'Unit';
  }

  @override
  TextEditingController total_quantity = TextEditingController();
  TextEditingController _skuController = TextEditingController();
 // TextEditingController completeNumber = TextEditingController();
  ExpansionTileController controller = ExpansionTileController();
  TextEditingController start_price = TextEditingController();
  TextEditingController nameItem = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController size = TextEditingController();
  final TextEditingController purchasingPrice = TextEditingController();

  final TextEditingController salePrice = TextEditingController();
  List<String> unit = ['box', 'cm', 'kg', 'Km', 'lb', 'mg', 'ml', 'pcs', 'dz'];
  final imagePicker = ImagePicker();
  File? image;
  XFile? pickedFile;
  uploadImage() async {
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile!.path);
      });
    } else {}
    print(image);
  }

  Widget build(BuildContext context) {
    nameItem.text=widget.item.name!;
    total_quantity.text=widget.item.total_qty.toString();
    _skuController.text=widget.item.SKU!;
    
    return BlocProvider(
      create: (context) => AddProductToInventoryBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: CustomAppbar(
            isnNotification: false,
            ispop: true,
            title: 'Update Product',
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [AppColor.purple1, AppColor.purple4]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          height: MediaQuery.of(context).size.height / 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  strokeAlign: BorderSide.strokeAlignCenter)
                              // color: AppColor.purple5
                              ),
                          //  color: AppColor.black,
                          child: InkWell(
                            onTap: () {
                              uploadImage();
                              print(image);
                            },
                            child: Center(
                                child: image == null
                                    ? widget.item.photo != null
                            ? Image.network(
                                '${AppUrl.UrlPhoto}${widget.item.photo!}',
                                fit: BoxFit.cover,
                                // width: MediaQuery.of(context)
                                //         .size
                                //         .width /
                                //     4,
                                // height: MediaQuery.of(context)
                                //         .size
                                //         .height /
                                //     3,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/no_photo.png',
                                    // fit: BoxFit.contain,
                                    // width: MediaQuery.of(context)
                                    //         .size
                                    //         .width /
                                    //     4,
                                    // height: MediaQuery.of(context)
                                    //         .size
                                    //         .height /
                                    //     3,
                                  );
                                },
                              )
                            : Image.asset(
                                'assets/images/no_photo.png',
                                fit: BoxFit.cover,
                                // width: MediaQuery.of(context)
                                //         .size
                                //         .width /
                                //     4,
                                // height: MediaQuery.of(context)
                                //         .size
                                //         .height /
                                //     3,
                              )
                                    : Image.file(
                                        image!,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: CustomTextField(
                              nameText: 'Product name',
                              readOnly: false,
                              nameController: nameItem,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: CustomTextField(
                              nameText: 'SKU',
                              nameController: _skuController,
                              readOnly: false,
                              icon: Icons.qr_code_2,
                              ontapIcon: () async {
                                print("object");
                                _skuController.clear();
                                // فتح صفحة ماسح الباركود وانتظار النتيجة
                                final scannedSku = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRViewExample()),
                                );
                                // إذا كانت النتيجة غير null، قم بتحديث TextField
                                if (scannedSku != null) {
                                  _skuController.text = scannedSku;
                                }
                              },
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: CustomTextField(
                              nameText: 'Weight',
                              readOnly: false,
                              nameController: weight,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.8,
                            height: MediaQuery.of(context).size.height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.white),
                            child: CustomTextField(
                              nameText: 'Size',
                              readOnly: false,
                              nameController: size,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.pink,
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: ExpansionTile(
                        controller: controller,
                        title: HeaderText(
                            text: selectedTitle!,
                            textcolor: AppColor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        //  backgroundColor: AppColor.pink,
                        collapsedShape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        //  collapsedBackgroundColor: AppColor.pink,
                        children: List.generate(unit.length, (index) {
                          return Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedTitle = unit[index];
                                  });
                                  return controller.collapse();
                                },
                                title: Center(child: Text(unit[index])),
                                textColor: AppColor.black,
                              ),
                              const Divider(
                                color: AppColor.grey3,
                                endIndent: 33,
                                indent: 33,
                              )
                            ],
                          );
                        })),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                WidgetUpsateQuantity(
                  total_quantity: total_quantity,
                ),
                SizedBox(
                  height: 20,
                ),
                WidgetUpdateSale(
                  purchasingPrice: purchasingPrice,
                  salePrice: salePrice,
                  start_price: start_price,
                ),
                SizedBox(
                  height: 20,
                ),
                BlocListener<AddProductToInventoryBloc, AddProductToInventoryState>(
                  listener: (context, state) {
                    if (state is SuccessAddItem) {
                          GoRouter.of(context).pushReplacement(
                                      AppRouter.kInventoryView);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text(state.message),
                                    backgroundColor: AppColor.blue1,
                                  ));
                    }
                    else if(state is NoConnection){
                      ScaffoldMessenger.of(context)
                                      .showSnackBar(new SnackBar(
                                    content: Text(
                                      state.message 
                                    ),
                                    backgroundColor: AppColor.red,
                                  ));
                    }
                  },
                  child: MyButton(
                      title: 'Add',
                      textcolor: AppColor.black,
                      fontsize: 20,
                      onpress: () {
                        AddItemInInventory item = AddItemInInventory(
                            SKU: _skuController.text,
                            name: nameItem.text,
                            sell_price: int.parse(salePrice.text),
                            pur_price: int.parse(purchasingPrice.text),
                            size_cubic_meters: int.parse(size.text),
                            weight: int.parse(weight.text),
                            start_price: int.parse(start_price.text),
                            total_quantity: int.parse(total_quantity.text),
                            unit: selectedTitle.toString());
                          context.read<AddProductToInventoryBloc>().add(AddItem(item:item , image: image!));
                      },
                      colors: AppColor.blue1,
                      width: 150,
                      height: 50,
                      radius: 20),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
