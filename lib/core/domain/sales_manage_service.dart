import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/all_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/show_all_current_sale_order_model.dart';
import 'package:mobile_warehouse_managment/core/data/warehouse_in_order_sale.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_end_point.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';

abstract class SalesManageService extends BaseService {
  Future<List<AllShipmentModel>> AllShipment ();
  Future<List<WarehouseInOrderSale>> getWarehousefromNeartoFar(int id);
  AddSaleOrder(AddSaleOrderModel order);
  Future<List<ShowAllCurrentSaleOrderModel>> AllSaleCurrentOrder ();    
}
class SalesManageServiceImp extends SalesManageService{
  @override
  Future<List<AllShipmentModel>> AllShipment() async{
    try {
      response = await dio.get("$URL${EndPoint.allShipment}", options: getHeader());
      List<AllShipmentModel> temp = List.generate(
        response!.data["data"].length,
        (index) => AllShipmentModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      }else {
        
        print("error in get data");
        return [];

      }
      
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }
  @override
 Future<List<WarehouseInOrderSale>> getWarehousefromNeartoFar(
      int id) async {
        print(id);
     try {
      response = await dio.get("$URL${EndPoint.warehousefromNeartoFar}$id",
          options: getHeader(useToken: true));
      if (response!.statusCode == 200) {
         print("success in get product in ware0");
        print(response!.data["data"]);
        List<WarehouseInOrderSale> temp = List.generate(
          response!.data["data"].length,
          (index) => WarehouseInOrderSale.fromMap(
              response!.data["data"][index]),
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
  AddSaleOrder(AddSaleOrderModel order) async{
    print(order);
    try {
      response = await dio.post("$URL${EndPoint.addSaleOrder}",
      options: getHeader(),
          data: order.toJson());
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
  Future<List<ShowAllCurrentSaleOrderModel>> AllSaleCurrentOrder() async{
    try {
      response = await dio.get("$URL${EndPoint.allCurrentSaleOrder}", options: getHeader());
      List<ShowAllCurrentSaleOrderModel> temp = List.generate(
        response!.data["data"].length,
        (index) => ShowAllCurrentSaleOrderModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      }else {
        
        print("error in get data");
        return [];

      }
      
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data["message"];
    }
  }
}