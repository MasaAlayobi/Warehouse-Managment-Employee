import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/get_header.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:mobile_warehouse_managment/core/data/login_model.dart';
import 'package:mobile_warehouse_managment/core/domain/base_service.dart';
import 'package:mobile_warehouse_managment/core/resourse/app_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthService extends BaseService {
  login(LoginModel user);
  logout();
  forget(String email);
}

class AuthServiceImp extends AuthService {
  @override
  login(LoginModel user) async {
    print(user.toJson());
    try {
      response = await dio.post(
        '$URL${entity = EndPoint.Login}',
        options: getHeader(useToken: false),
        data: user.toJson(),
      );

      if (response!.statusCode == 200) {
        // print(response!.data);
        storage
            .get<SharedPreferences>()
            .setString('token', response!.data['data']);
        print(storage.get<SharedPreferences>().getString('token'));
        return response!.data["message"];
      } else {
        print("object");
      }
    } on DioException catch (e) {
      print(e.response!.data);
      throw e.response!.data;
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  logout() async {
    try {
      response =
          await dio.post('$URL/auth/employee/logout', options: getHeader());
      print(response!.data);
      if (response!.statusCode == 200) {
        print(response!.data);

        storage.get<SharedPreferences>().remove('token');
        return response!.data['message'];
      } else {
        print('**************************');
        return [];
      }
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } on Error catch (e) {
      throw e;
    }
  }

  @override
  forget(String email) async {
    try {
      response = await dio.post(
          '$URL/auth/employee/password/forgot-password/employees',
          data: {"email": email},
          options: getHeader(useToken: false));
      print(response!.data);
      if (response!.statusCode == 200) {
        print(response!.data);

        return response!.data['message'];
      } else {
        print('**************************');
        return [];
      }
    } on DioException catch (e) {
      throw e.response!.data['message'];
    } on Error catch (e) {
      throw e;
    }
  }
}
