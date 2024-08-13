class AppUrl {
  static String baseUrl = 'https://f2e3-149-34-244-166.ngrok-free.app/api';
  static String UrlPhoto = 'http://127.0.0.1:8000/storage/';
}

abstract class EndPoint {
  static String Login = '/auth/employee/login';
  static String getWare = '/employee/warehouse/show-all';
  static String addItemToInventory = '/item/store';
  static String getItemInStripped = '/item/show-all';
  static String DeleteItem = '/item/delete/';
  static String updateItem = '/item/update-in-warehouse/';
  static String allShipment = '/shipment/show-all';
  static String allSupplier = '/employee/supplier/show-all';
  static String warehousefromNeartoFar =
      '/orders/sell/show-nearest-warehouse/with-quantity/';
  static String addSaleOrder = '/orders/sell/store';
}
