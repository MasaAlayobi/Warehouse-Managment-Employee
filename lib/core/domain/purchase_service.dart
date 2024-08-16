import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/addOrder.dart';
import 'package:mobile_warehouse_managment/core/data/status.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';

abstract class PurchaseService extends BaseService {
  showAllorder();
  showDetailsAnOrderPurchase(int id);
  addOrderPurchase(AddOrderPurchaseModel addOrder);
  changeStatus(int id, StatusModel status);
}

class purchaseServiceImpl extends PurchaseService {
  @override
  showAllorder() async {
    try {
      response = await dio.get("$URL/orders/purchase/show-all?filter[order]=",
          options: getHeader());
      if (response!.statusCode == 200) {
        print(response);
        return response!.data["data"];
      } else {
        return response!.data["message"];
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }

  @override
  showDetailsAnOrderPurchase(int id) async {
    try {
      response =
          await dio.get("$URL/orders/purchase/show/1", options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.statusCode);
        return response!.data["data"];
      } else {
        return response!.data["message"];
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }

  @override
  changeStatus(int id, StatusModel status) async {
    try {
      response = await dio.post("$URL/orders/purchase/changeStatus/$id",
          data: status.toMap(), options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.data["message"]);
        return response!.data["message"];
      } else {
        print(response!.statusCode);
      }
    } on DioException catch (e) {
      return e.response!.data["message"];
    } catch (e) {
      print(e);
    }
  }

  @override
  addOrderPurchase(AddOrderPurchaseModel addOrder) async {
    try {
      response = await dio.post("$URL/orders/purchase/store",
          data: addOrder.toMap(), options: getHeader());
      if (response!.statusCode == 201) {
        print(response!.data["message"]);
        return response!.data["message"];
      } else {
        print(response!.statusCode);
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }
}
