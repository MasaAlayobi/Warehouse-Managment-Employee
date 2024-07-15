import 'package:dio/dio.dart';
import 'package:mobile_warehouse_managment/core/config/store/getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

getHeader({bool useToken = true}) {
  if (useToken) {
    return Options(headers: {
      "Content-Type":"application/json",
     "X-Requested-With":"XMLHttpRequest",
      "authorization":
          storage.get<SharedPreferences>().getString('token'),
      
    });
  }else {
      return Options(headers: {
     "Content-Type":"application/json",
     "X-Requested-With":"XMLHttpRequest",
    //  "ngrok-skip-browser-warning": "69420",
    });
   }
}