// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_details_in_sale_bloc.dart';

@immutable
sealed class OrderDetailsInSaleEvent {}
class GetDetailsSaleOrder extends OrderDetailsInSaleEvent {
  int id;
  GetDetailsSaleOrder({
    required this.id,
  });
}
