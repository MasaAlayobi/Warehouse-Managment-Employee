// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_order_bloc.dart';

@immutable
sealed class AddOrderEvent {}
class GetWarehousefromNeartoFar extends AddOrderEvent {
  int id;
  GetWarehousefromNeartoFar({
    required this.id,
  });
}
class AddSaleOrder extends AddOrderEvent{
  AddSaleOrderModel order;
  AddSaleOrder({
    required this.order,
  });
} 
