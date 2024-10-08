class AppUrl {
  static String baseUrl = 'https://a8a2-178-52-82-149.ngrok-free.app/api';
  static String UrlPhoto = 'https://a8a2-178-52-82-149.ngrok-free.app/storage/';
}

//http://127.0.0.1:8000
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
  static String allCurrentSaleOrder = '/orders/sell/show-all?filter[order]=';
  static String detailsOrderInCurrentSale = '/orders/sell/show/';
  static String previousSaleShipment = '/shipment/show-all-received';
  static String addOrderInShipment = '/shipment/add-order-in-shipment/';
  static String changeOrderStatus='/orders/sell/changeStatus/';
  static String allDriver='/shipment/show-drivers';
  static String addshipment='/shipment/store';
  static String changeShipmentStatus='/orders/sell/shipment/changeStatus/';
}
