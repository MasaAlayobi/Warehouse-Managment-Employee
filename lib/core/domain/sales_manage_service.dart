import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/add_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/all_drevier_model.dart';
import 'package:mobile_warehouse_managment/core/data/all_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/dateReport.dart';
import 'package:mobile_warehouse_managment/core/data/details_order_in_current_sale.dart';
import 'package:mobile_warehouse_managment/core/data/previous_sale_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/show_all_current_sale_order_model.dart';
import 'package:mobile_warehouse_managment/core/data/warehouse_in_order_sale.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_end_point.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:mobile_warehouse_managment/feature/salesManage/shipments/addShipment/bloc/add_shipment_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SalesManageService extends BaseService {
  Future<List<AllShipmentModel>> AllShipment();
  Future<List<WarehouseInOrderSale>> getWarehousefromNeartoFar(int id);
  AddSaleOrder(AddSaleOrderModel order);
  Future<List<ShowAllCurrentSaleOrderModel>> AllSaleCurrentOrder();
  ShowDetailsOrderInCurrentsale(int id);
  Future<List<PreviousSaleShipmentModel>> AllPreviousSaleOrder();
  AddOrderInShipment(int orderId ,int shipmentId);
  ChangeOrderStatus(int orderId,String status);
  Future<List<AllDrevierModel>> AllDriver();
  AddShipment(AddShipmentModel shipment);
  ChangeShipmentStatus(int shipmentId,String status);
 // AddOrderInShipment(int orderId, int shipmentId);
  createReportSales(DateReportModel dates);
  deleteOrder(int id);
}

class SalesManageServiceImp extends SalesManageService {
  @override
  Future<List<AllShipmentModel>> AllShipment() async {
    try {
      response =
          await dio.get("$URL${EndPoint.allShipment}", options: getHeader());
      List<AllShipmentModel> temp = List.generate(
        response!.data["data"].length,
        (index) => AllShipmentModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      } else {
        print("error in get data");
        return [];
      }
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }

  @override
  Future<List<WarehouseInOrderSale>> getWarehousefromNeartoFar(int id) async {
    print(id);
    try {
      response = await dio.get("$URL${EndPoint.warehousefromNeartoFar}$id",
          options: getHeader(useToken: true));
      if (response!.statusCode == 200) {
        print("success in get product in ware0");
        print(response!.data["data"]);
        List<WarehouseInOrderSale> temp = List.generate(
          response!.data["data"].length,
          (index) =>
              WarehouseInOrderSale.fromMap(response!.data["data"][index]),
        );
        print('----------------------------');
        print(temp);
        return temp;
      } else {
        print("error in get data");
        return [];
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
  AddSaleOrder(AddSaleOrderModel order) async {
    print(order);
    try {
      response = await dio.post("$URL${EndPoint.addSaleOrder}",
          options: getHeader(), data: order.toJson());
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
  Future<List<ShowAllCurrentSaleOrderModel>> AllSaleCurrentOrder() async {
    try {
      response = await dio.get("$URL${EndPoint.allCurrentSaleOrder}",
          options: getHeader());
      List<ShowAllCurrentSaleOrderModel> temp = List.generate(
        response!.data["data"].length,
        (index) =>
            ShowAllCurrentSaleOrderModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      } else {
        print("error in get data");
        return [];
      }
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }

  @override
  ShowDetailsOrderInCurrentsale(int id) async {
    try {
      response = await dio.get("$URL${EndPoint.detailsOrderInCurrentSale}$id",
          options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.statusCode);
        print('---------------------');
        return response!.data["data"];
      } else {
        return response!.data["message"];
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }

  @override
  Future<List<PreviousSaleShipmentModel>> AllPreviousSaleOrder() async {
    try {
      response = await dio.get("$URL${EndPoint.previousSaleShipment}",
          options: getHeader());
      List<PreviousSaleShipmentModel> temp = List.generate(
        response!.data["data"].length,
        (index) =>
            PreviousSaleShipmentModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      } else {
        print("error in get data");
        return [];
      }
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }

  @override
  AddOrderInShipment(int orderId, int shipmentId) async {
    print('order Id : $orderId');
    print('shipment Id : $shipmentId');
    try {
      response = await dio.post("$URL${EndPoint.addOrderInShipment}$shipmentId",
          options: getHeader(), data: jsonEncode({"order_id": orderId}));
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
  ChangeOrderStatus(int orderId, String status) async{
    try {
      response = await dio.post("$URL${EndPoint.changeOrderStatus}$orderId",
          data: jsonEncode({"status": status }), options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.data["message"]);
        return response!.data["message"];
      } else {
        print(response!.statusCode);
      }
    } on DioException catch (e) {
      print('*****************************');
      print(e.response!.data["message"]);
     throw e.response!.data["message"];
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Future<List<AllDrevierModel>> AllDriver() async{
    try {
      response = await dio.get("$URL${EndPoint.allDriver}",
          options: getHeader());
      List<AllDrevierModel> temp = List.generate(
        response!.data["data"].length,
        (index) =>
            AllDrevierModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      } else {
        print("error in get data");
        return [];
      }
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }
  
  @override
  AddShipment(AddShipmentModel shipment) async{
    try {
      response = await dio.post("$URL${EndPoint.addshipment}",
          options: getHeader(), data: shipment.toJson());
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
      throw e.response!.data["message"];
    } on Error {
      print(Error());
    }
    print("object");
  }
  
  @override
  ChangeShipmentStatus(int shipmentId, String status) async{
     try {
      response = await dio.post("$URL${EndPoint.changeShipmentStatus}$shipmentId",
          data: jsonEncode({"status": status }), options: getHeader());
      if (response!.statusCode == 200) {
        print(response!.data["message"]);
        return response!.data["message"];
      } else {
        print(response!.statusCode);
      }
    } on DioException catch (e) {
      print('*****************************');
      print(e.response!.data["message"]);
     throw e.response!.data["message"];
    } catch (e) {
      print(e);
    }}
  @override
  createReportSales(DateReportModel dates) async {
    try {
      response = await dio.get("$URL/reports/sales",
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
  
  @override
  deleteOrder(int id)async {
 try {
      response = await dio.delete("$URL/orders/sell/delete/$id",
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
}


