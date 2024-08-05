import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';

abstract class ComplainttoadminService extends BaseService {
  sendComplaint(String complaint);
}

class ComplainttoadminImpl extends ComplainttoadminService {
  @override
  sendComplaint(String complaint) async {
    try {
      response = await dio.post(
        "${URL}/Compliant/WriteComplaintEmployees",
        data: {"content": complaint},
        options: getHeader(useToken: true),
      );
      if (response!.statusCode == 200) {
        print(response!.data);
        return true;
      } else {
        print(response!.data);
        return false;
      }
    } on DioException catch (e) {
      print(response!.data);
      print(e);
      return false;
    }
  }
}
