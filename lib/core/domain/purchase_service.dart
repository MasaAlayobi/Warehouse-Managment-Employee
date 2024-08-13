import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';

abstract class PurchaseService extends BaseService {
  showAllorder();
  showDetailsAnOrderPurchase(int id);
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
        print(response);
        return response!.data["data"];
      } else {
        return response!.data["message"];
      }
    } on DioException catch (e) {
      throw e.response!.data["message"];
    }
  }
}
