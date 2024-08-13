part of 'purchase_order_bloc.dart';

@immutable
sealed class PurchaseOrderEvent {}
class GetPurchaseOrderEvent extends PurchaseOrderEvent{}