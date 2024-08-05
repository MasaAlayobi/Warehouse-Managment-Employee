import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/add_item_in_inventory.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/data/productWithVeicleInWare.dart';
import 'package:mobile_warehouse_managment/core/data/storeItemInWH.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';

abstract class InventoryService extends BaseService {
  getAllWarehouses();
  addProductToInventory(AddItemInInventory product,File image );
  Future<List<ItemInStripped>> getItemInStripped(String lable);
  DeletItem(int Id);
  Future<List<ProductwithveicleinwareModel>> getProductsInWarehouse(int id);
  updateItemInWare(storeItemInWHModel addItem, int idItem);
}

class InventoryServiceImpl extends InventoryService {
  @override
  getAllWarehouses() async {
    try {
      response = await dio.get("$URL/employee/warehouse/show-all",
          options: getHeader(useToken: true));
      if (response!.statusCode == 200) {
        print(response!.data["data"]);
        return response!.data["data"];
      } else {
        print("error in get data1");
      }
    } on DioException catch (e) {
      print(e);
      rethrow;
    } on Error {
      print("error in get data in error exp1");
    }
  }

  @override
  Future<List<ProductwithveicleinwareModel>> getProductsInWarehouse(
      int id) async {
    try {
      response = await dio.get("$URL/employee/warehouse/show/$id",
          options: getHeader(useToken: true));
      if (response!.statusCode == 200) {
        print("success in get product in ware0");
        print(response!.data["data"]);
        List<ProductwithveicleinwareModel> temp = List.generate(
          response!.data["data"].length,
          (index) => ProductwithveicleinwareModel.fromMap(
              response!.data["data"][index]),
        );
        return temp;
      } else {
        print("error in get data");
      }
    } on DioException catch (e) {
      print(e);
      rethrow;
    } on Error {
      print("error in get data in error exp");
    }
    return response!.data["data"][0];
  }

  @override
  addProductToInventory(AddItemInInventory product, File image) async {
    Map<String, dynamic> data = json.decode(product.toJson());
    print(data);
    FormData formData = FormData.fromMap(data);
    formData.files.addAll({
      "photo": await MultipartFile.fromFile(image.path,
          filename: image.path.split("/").last),
    }.entries);
    print(formData);
    try {
      response = await dio.post(URL + EndPoint.addItemToInventory,
          data: formData, options: getHeader());
      if (response!.statusCode == 201) {
        print(response!.data);
        return response!.data["message"];
      } else {
        print(response!.data["message"]);
        print("error in get data");
      }
    } on DioException catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);
      throw e.response!.data["message"];
    } on Error {
      print(Error());
    }
    print("object");
  }

  @override
  Future<List<ItemInStripped>> getItemInStripped(String lable) async{
    String ser='';
   try{
       response=await dio.get(URL + EndPoint.getItemInStripped+'?filter[item]=$lable',
       options: getHeader());
       if(response!.statusCode==200){
         print(response!.data["data"]);
        dynamic temp=response!.data["data"];
        List<ItemInStripped> allProduct=List.generate(temp.length, (index) => ItemInStripped.fromMap(temp[index]));
        print(allProduct);
        return allProduct;
      } else {
        print('empty');
        return [];
      }
    } on DioException catch (e) {
      print(']]]]]]]]]]]]]]]]]]]]]]]');
      print(e.response!.data["message"]);
      throw e.response!.data.toString();
    } on Error catch (e) {
      print('88888888888888888888888');
      throw e.toString();
    }
  }

  @override
  DeletItem(int Id) async {
    try {
      response = await dio.delete(URL + EndPoint.DeleteItem + Id.toString(),
          options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.data);
        return response!.data["message"];
      } else {
        print(response!.data["message"]);
        print("error in get data");
      }
    } on DioException catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);
      throw e.response!.data;
    } on Error {
      print(Error());
    }
    print("object");
  }

  @override
  updateItemInWare(storeItemInWHModel addItem, int idItem) async {
    try {
      response = await dio.post(URL + EndPoint.updateItem + idItem.toString(),
          data: addItem.toMap(), options: getHeader());
      if (response!.statusCode == 201) {
        print(response!.data["message"]);
        return true;
      } else {
        print(response!.data["message"]);
        print("error in get data");
        return false;
      }
    } on DioException catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);
      throw false;
    } on Error {
      print(Error());
    }
    print("object");
  }
}
