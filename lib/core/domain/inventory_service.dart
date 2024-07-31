import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/add_item_in_inventory.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/bloc/warehouses_bloc.dart';

abstract class InventoryService extends BaseService {
  getAllWarehouses();
  addProductToInventory(AddItemInInventory product,File image );
  Future<List<ItemInStripped>> getItemInStripped();
  DeletItem(int Id);

}

class InventoryServiceImpl extends InventoryService {
  @override
  getAllWarehouses() async {
    try {
      response = await dio.get(URL + EndPoint.getWare, options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.data["data"]);
        return response!.data["data"];
      } else {
        print(response!.data["data"]);
        print("error in get data");
      }
    } on DioException catch (e) {
      print("error in get data in dio exp");
      throw e.response!.data["message"];
    } on Error {
      print("error in get data in error exp");
    }
    print("object");
  }
  
  @override
  addProductToInventory(AddItemInInventory product, File image) async {
     Map<String, dynamic> data = json.decode(product.toJson());
     print(data);
     FormData formData = FormData.fromMap(data);
formData.files.addAll({
"photo":await MultipartFile.fromFile(image.path,
      filename: image.path.split("/").last),
}.entries);
print(formData);
    try {
      response = await dio.post(URL + EndPoint.addItemToInventory, 
      data: formData,
      options: getHeader());
      if (response!.statusCode == 201) {
        print(response!.data);
        return response!.data["message"];
      } else {
        print(response!.data["message"]);
        print("error in get data");
      }
    } 
    on DioException catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);
      throw e.response!.data["message"];
     }
    on Error {
      print(Error());
    }
    print("object");
  }
  
  @override
  Future<List<ItemInStripped>> getItemInStripped() async{
   try{
       response=await dio.get(URL + EndPoint.getItemInStripped,
       options: getHeader());
       if(response!.statusCode==200){
         print(response!.data["data"]);
        dynamic temp=response!.data["data"];
        List<ItemInStripped> allProduct=List.generate(temp.length, (index) => ItemInStripped.fromMap(temp[index]));
        print(allProduct);
        return allProduct;
       }
       else{
         print('empty');
       return[];
       } 
   }on DioException catch(e){
    print(']]]]]]]]]]]]]]]]]]]]]]]');
         print(e.response!.data["message"]);
         throw e.response!.data.toString();
   }on Error catch(e){
    print('88888888888888888888888');
    throw e.toString();
   }
   
  }
  
  @override
  DeletItem(int Id)async {
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
    } 
    on DioException catch (e) {
      print(e.response!.data);
      print(e.response!.statusCode);
      throw e.response!.data;
     }
    on Error {
      print(Error());
    }
    print("object");
  }
}
