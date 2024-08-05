import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/data/addClient.dart';
import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';

abstract class CustomerService extends BaseService {
  getCustomers();
  getDetailToClient(int id);
  addCustomer(AddclientModel client);
  deleteCustomer(int id);
}

class CustomerServiceImpl extends CustomerService {
  @override
  getCustomers() async {
    try {
      response = await dio.get("$URL/client/show-all", options: getHeader());
      var temp = List.generate(
        response!.data["data"].length,
        (index) => CustomerinfoModel.fromMap(response!.data["data"][index]),
      );
      if (response!.statusCode == 200) {
        print("temp$temp");
        return temp;
      }
    } on DioException catch (e) {
      throw e;
    }
  }

  @override
  getDetailToClient(int id) async {
    try {
      response = await dio.get("$URL/client/show/$id", options: getHeader());

      if (response!.statusCode == 200) {
        print(response!.data["data"]);
        return response!.data["data"];
      } else {
        return response!.data["message"];
      }
    } on DioException catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  addCustomer(AddclientModel client) async {
    try {
      print(client.toMap());
      response = await dio.post("$URL/client/store",
          options: getHeader(), data: client.toMap());
      if (response!.statusCode == 201) {
        print(response!.data);
        return true;
      } else {
        print(response!.data);
        return false;
      }
    } on DioException catch (e) {
      // print(response!.data["message"]);
      print(e);
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  deleteCustomer(int id) async {
    try {
      response =
          await dio.delete("$URL/client/delete/$id", options: getHeader());
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
