

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_warehouse_managment/core/config/widget/Titles.dart';
import 'package:mobile_warehouse_managment/core/config/widget/myTextFieldNumber.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_sale_model.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseProduct.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_color.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';

class ChooseItemWidget extends StatefulWidget {
  String text1;
  final List<WarehouseproductModel> items;
  // String text2;
  // String text3;
  bool? variable;
  final Function(List<Map>) onDataChanged;
  Widget widget;
  ChooseItemWidget({
    Key? key,
    required this.text1,
    // required this.text2,
    // required this.text3,
    this.variable,
    required this.widget,
    required this.onDataChanged, required this.items,
  }) : super(key: key);

  @override
  State<ChooseItemWidget> createState() => _myExpansionTileState();
}

class _myExpansionTileState extends State<ChooseItemWidget> {
  List<Map> ItemId = [];
  String? selectedTitle;
  ExpansionTileController controller = ExpansionTileController();
  TextEditingController min_bill_price = TextEditingController();
  void someFunctionThatChangesData(List<Map> ItemId) {
    widget.onDataChanged(ItemId);
  }

  @override
  void initState() {
    super.initState();
    selectedTitle = widget.text1; // تعيين القيمة الابتدائية للعنوان
  }

  List<bool> isCheckedCheckBox2 = [];
  @override
  Widget build(BuildContext context) {
    return 
       ExpansionTile(
        onExpansionChanged: (value) {
          print(widget.items);
          if (value == false) {
            someFunctionThatChangesData(ItemId);
          } else {}
          print(value);
        },
        title: Row(
              children: [
                Icon(Icons.production_quantity_limits,color: AppColor.purple3,),
                SizedBox(
                  width: 15,
                ),
                Text(
                  selectedTitle!,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
        backgroundColor: Colors.grey[200],
        collapsedShape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        collapsedBackgroundColor: Colors.grey[200],
        textColor: AppColor.purple3,
        iconColor: AppColor.purple3,
        children: [
         ListView.separated(
                    itemCount: widget.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      isCheckedCheckBox2.add(false);
                      return InkWell(
                        onTap: () {
                          // citiesId
                          //     .add(state.Cities[ind].childrens[index].id);
                          // print(citiesId);
                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SignUp(
                          //       // cityId: ind,
                          //       cititesId: citiesId,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 33, vertical: 11),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Container(
                  width: 70,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    // color: AppColor.purple5
                  ),
                  child: widget.items[index].photo != null
                      ? Image.network(
                          '${AppUrl.UrlPhoto}${widget.items[index].photo}',
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/no_photo.png',
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 3,
                            );
                          },
                        )
                      : Image.asset(
                          'assets/images/no_photo.png',
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                ),
              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                                                    
                                    child: HeaderText(
                                      text: "Name : ${widget.items[index].name!}",
                                      fontSize: 16,
                                      textcolor:AppColor.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                   Container(
                                                                     
                                     child: HeaderText(
                                       text: 'Available quantity : ${widget.items[index].available_qty.toString()}',
                                       fontSize: 16,
                                       textcolor:AppColor.black,
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),
                                   Container(
                                                                     
                                     child: HeaderText(
                                       text: 'Sell price : ${widget.items[index].sell_price.toString()}',
                                       fontSize: 16,
                                       textcolor:AppColor.black,
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),
                                ],
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => Checkbox(
                                  activeColor: AppColor.blue1,
                                  value: isCheckedCheckBox2[index],
                                  onChanged: (bool? value) {
                                    print('-------------------------');
                                    print(value);
                                    if (value == true) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Builder(
                                              builder: (context) {
                                            return Directionality(
                                              textDirection:
                                                  TextDirection.rtl,
                                              child: AlertDialog(
                                                content:
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Text(
                                                            ' Enter the quantity to be sold ',
                                                            style: TextStyle(
                                                                color: AppColor
                                                                    .purple2,
                                                                fontSize:
                                                                    15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ),
                                                      SizedBox(
                                                          height: 70,
                                                          width: 200,
                                                          child: myTextFieldNumber(
                                                              phoneController:
                                                                  min_bill_price))
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: Text('add',
                                                        style: TextStyle(
                                                            color: AppColor
                                                                .purple3)),
                                                    onPressed: () {
                                                      ItemId.add(ItemInSaleModel(id: widget.items[index].id,quantity:  int.parse(
                                                                      min_bill_price
                                                                          .text))
                                                          .toMap());
                                                       print(ItemId);
                                                      setState(() {
                                                        min_bill_price
                                                            .clear();
                                                        isCheckedCheckBox2[
                                                            index] = value!;
                                                        // isCheckedCheckBox2=
                                                      });
                                                      GoRouter.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    child: Text(
                                                      'cancel',
                                                      style: TextStyle(
                                                          color:AppColor
                                                              .purple3),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                        },
                                      );
                                    } else {
                                       ItemId.removeWhere((element) => element["id"] == widget.items[index].id);
                                    print(ItemId);
                                      setState(() {
                                        isCheckedCheckBox2[index] = value!;
                                        // isCheckedCheckBox2=
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      indent: 22,
                      endIndent: 22,
                    ),
                  ),
                 
        ],
      );
    
  }
}
