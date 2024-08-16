// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_shipment_bloc.dart';

@immutable
sealed class AllShipmentState {}

final class AllShipmentInitial extends AllShipmentState {}
class SuccessFetchAllShipment extends AllShipmentState {
  List<AllShipmentModel> allShipment;
  SuccessFetchAllShipment({
    required this.allShipment,
  });
}
class Loading extends AllShipmentState{}
class NoConnectionWithAllShipment extends AllShipmentState {
  String message;
  NoConnectionWithAllShipment({
    required this.message,
  });
}
