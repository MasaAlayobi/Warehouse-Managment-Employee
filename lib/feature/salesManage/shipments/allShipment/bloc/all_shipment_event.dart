part of 'all_shipment_bloc.dart';

@immutable
sealed class AllShipmentEvent {}
class GetAllShipment extends AllShipmentEvent{}
class ChangeShipmentStatus extends AllShipmentEvent {
  int shipmentId;
  String status;
  ChangeShipmentStatus({
    required this.shipmentId,
    required this.status,
  });
}