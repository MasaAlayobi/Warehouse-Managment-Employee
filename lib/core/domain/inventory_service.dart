import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseInfo.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/inventory/warehouses/bloc/warehouses_bloc.dart';

abstract class InventoryService extends BaseService {
  getAllWarehouses();
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
}
