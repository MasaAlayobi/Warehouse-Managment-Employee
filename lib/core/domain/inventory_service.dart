import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/productWithVeicleInWare.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';

abstract class InventoryService extends BaseService {
  getAllWarehouses();
  Future<List<ProductwithveicleinwareModel>> getProductsInWarehouse(int id);
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
}
