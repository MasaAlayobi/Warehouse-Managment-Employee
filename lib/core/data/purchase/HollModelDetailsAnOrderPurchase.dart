import '../customerInfo.dart';
import 'OrderPurchase.dart';
import 'detailsOrderPurchase.dart';

class  HollModelOfDetailsOrderPurchase{
  

  int id;
  String? status;
  DetailsPurchaseOrderModel? order;
  CustomerinfoModel? supplier;
  HollModelOfDetailsOrderPurchase({
    required this.id,
    this.status,
    this.order,
    this.supplier,
  });

}