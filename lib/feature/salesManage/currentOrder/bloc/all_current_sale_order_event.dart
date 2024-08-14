// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_current_sale_order_bloc.dart';

@immutable
sealed class AllCurrentSaleOrderEvent {}
class SuccessfetchOrder extends AllCurrentSaleOrderState {
  List<ShowAllCurrentSaleOrderModel> orders;
  SuccessfetchOrder({
    required this.orders,
  });
}
class NoConnection extends AllCurrentSaleOrderState {
  String message;
  NoConnection({
    required this.message,
  });
}
class Loading extends AllCurrentSaleOrderState{}
