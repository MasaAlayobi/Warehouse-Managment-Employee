part of 'details_of_order_puchase_bloc.dart';

@immutable
sealed class DetailsOfOrderPuchaseEvent {}

class GetDetailsPurchaseOrder extends DetailsOfOrderPuchaseEvent {
  int id;
  GetDetailsPurchaseOrder({required this.id});
}
