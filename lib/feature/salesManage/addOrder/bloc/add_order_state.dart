// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_order_bloc.dart';

@immutable
sealed class AddOrderState {}

final class AddOrderInitial extends AddOrderState {}
class Loading extends AddOrderState{}
class SuccessFetchWarehouse extends AddOrderState {
  List<WarehouseInOrderSale> item;
  SuccessFetchWarehouse({
    required this.item,
  });
}
class NoConnection extends AddOrderState {
  String message;
  NoConnection({
    required this.message,
  });
}
class SuccessAddSaleOrder extends AddOrderState {
  String message;
  SuccessAddSaleOrder({
    required this.message,
  });
}
class NoConnectionWithAdd extends AddOrderState {
  String message;
  NoConnectionWithAdd({
    required this.message,
  });
}