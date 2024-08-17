// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_current_sale_order_bloc.dart';

@immutable
sealed class AllCurrentSaleOrderState {}

final class AllCurrentSaleOrderInitial extends AllCurrentSaleOrderState {}
class GetAllCurrentSaleOrder extends AllCurrentSaleOrderEvent{}
class AddOrderInShipment extends AllCurrentSaleOrderEvent {
  int orderId;
  int shipmentId;
  AddOrderInShipment({
    required this.orderId,
    required this.shipmentId,
  });
}
class ChangeOrderStatus extends AllCurrentSaleOrderEvent {
  int orderId;
  String status;
  ChangeOrderStatus({
    required this.orderId,
    required this.status,
  });
}
