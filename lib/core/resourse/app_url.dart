class AppUrl {
  static String baseUrl = 'https://mangauwarespace.000webhostapp.com/api';
}

abstract class EndPoint {
  static String Login = '/auth/employee/login';
  static String getWare = '/employee/warehouse/show-all';
  static String addItemToInventory = '/item/store';
}
