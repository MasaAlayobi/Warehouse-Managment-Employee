import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/all_supplier_model.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';

abstract class SupplierService extends BaseService {
  Future<List<AllSupplierModel>> AllSupplier ();
}
class SupplierServiceImp extends SupplierService{
  @override
  Future<List<AllSupplierModel>> AllSupplier()async {
     try {
      response = await dio.get("$URL${EndPoint.allSupplier}", options: getHeader());
      List<AllSupplierModel> temp = List.generate(
        response!.data["data"].length,
        (index) => AllSupplierModel.fromMap(response!.data["data"][index]),
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