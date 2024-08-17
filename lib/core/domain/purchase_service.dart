import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/dateReport.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/addOrder.dart';
import 'package:mobile_warehouse_managment/core/data/status.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PurchaseService extends BaseService {
  showAllorder();
  showDetailsAnOrderPurchase(int id);
  addOrderPurchase(AddOrderPurchaseModel addOrder);
  changeStatus(int id, StatusModel status);
  deletePurchaseOrder(int id);
  createReport(DateReportModel dates);
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

  @override
  deletePurchaseOrder(int id) async {
    try {
      response = await dio.delete("$URL/orders/purchase/delete/$id",
          options: getHeader());
      if (response!.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e);
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  createReport(DateReportModel dates) async {
    try {
      response = await dio.get("$URL/reports/purchases",
          options: Options(
            headers: {
              "Content-Type": "application/json",
              "X-Requested-With": "XMLHttpRequest",
              "authorization":
                  "Bearer ${storage.get<SharedPreferences>().getString('token')}",
            },
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            },
          ),
          data: dates.toMap());
      if (response!.statusCode == 200) {
        print(response!.data);
        return response!.data;
      }
    } on DioException catch (e) {
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
