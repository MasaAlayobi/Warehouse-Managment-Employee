class AppUrl {
  static String baseUrl = 'https://5b9e-94-47-139-168.ngrok-free.app/api';
  static String UrlPhoto='https://5b9e-94-47-139-168.ngrok-free.app/storage/';
}

abstract class EndPoint {
  static String Login = '/auth/employee/login';
  static String getWare = '/employee/warehouse/show-all';
  static String addItemToInventory = '/item/store';
  static String getItemInStripped='/item/show-all';
  static String DeleteItem='/item/delete/';
}
  