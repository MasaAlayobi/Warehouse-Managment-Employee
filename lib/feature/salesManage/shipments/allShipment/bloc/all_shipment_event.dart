part of 'all_shipment_bloc.dart';

@immutable
sealed class AllShipmentEvent {}
class GetAllShipment extends AllShipmentEvent{}