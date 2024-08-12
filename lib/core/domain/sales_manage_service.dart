import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/all_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_end_point.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';

abstract class SalesManageService extends BaseService {
  Future<List<AllShipmentModel>> AllShipment ();
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

}