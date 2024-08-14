part of 'all_current_sale_order_bloc.dart';

@immutable
sealed class AllCurrentSaleOrderState {}

final class AllCurrentSaleOrderInitial extends AllCurrentSaleOrderState {}
class GetAllCurrentSaleOrder extends AllCurrentSaleOrderEvent{}