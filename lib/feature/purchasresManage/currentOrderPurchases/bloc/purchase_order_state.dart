part of 'purchase_order_bloc.dart';

@immutable
sealed class PurchaseOrderState {}

final class PurchaseOrderInitial extends PurchaseOrderState {}
class SuccessGetPurchase extends PurchaseOrderState {
  List<AllPurchaseOrderModel> listWarehouseInState;
  SuccessGetPurchase({
    required this.listWarehouseInState,
  });
}
class FailedGetPurchase extends PurchaseOrderState{}
class LoadedGetPurchase extends PurchaseOrderState{}
class EmptyGetPurchase extends PurchaseOrderState{}