// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'previous_sale_bloc.dart';

@immutable
sealed class PreviousSaleState {}

final class PreviousSaleInitial extends PreviousSaleState {}
class SuccessFetchPreviousSale extends PreviousSaleState {
  List<PreviousSaleShipmentModel> shipment;
  SuccessFetchPreviousSale({
    required this.shipment,
  });
}
class Loading extends PreviousSaleState{}
class NoConnection extends PreviousSaleState {
  String message;
  NoConnection({
    required this.message,
  });
}
