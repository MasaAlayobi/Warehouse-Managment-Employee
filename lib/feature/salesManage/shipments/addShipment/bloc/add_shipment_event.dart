part of 'add_shipment_bloc.dart';

@immutable
sealed class AddShipmentEvent {}
class GetAllDriver extends AddShipmentEvent{}

class AddShipment extends AddShipmentEvent{
  AddShipmentModel shipment;
   AddShipment({
    required this.shipment,
  });
}