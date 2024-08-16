// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_details_in_sale_bloc.dart';

@immutable
sealed class OrderDetailsInSaleState {}

final class OrderDetailsInSaleInitial extends OrderDetailsInSaleState {}
class SuccessFetchSaleOrderDetails extends OrderDetailsInSaleState {
  DetailsOrderInCurrentSale order;
  SuccessFetchSaleOrderDetails({
    required this.order,
  });
}
class Loading extends OrderDetailsInSaleState{}
class NoConnection extends OrderDetailsInSaleState {
  String message;
  NoConnection({
    required this.message,
  });
}
