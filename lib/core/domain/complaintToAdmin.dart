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
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }
}
