class AppUrl {
  static String baseUrl = 'http://127.0.0.1:8000/api';
  static String UrlPhoto='http://127.0.0.1:8000/storage/';
}

abstract class EndPoint {
  static String Login = '/auth/employee/login';
  static String getWare = '/employee/warehouse/show-all';
  static String addItemToInventory = '/item/store';
  static String getItemInStripped='/item/show-all';
  static String DeleteItem='/item/delete/';
}
  