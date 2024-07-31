class AppUrl {
  static String baseUrl = 'https://2e2f-178-52-96-77.ngrok-free.app/api';
}

abstract class EndPoint {
  static String Login = '/auth/employee/login';
  static String getWare = '/employee/warehouse/show-all';
  static String addItemToInventory = '/item/store';
}
