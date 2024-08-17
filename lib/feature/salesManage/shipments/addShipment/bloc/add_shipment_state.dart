// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_shipment_bloc.dart';

@immutable
sealed class AddShipmentState {}

final class AddShipmentInitial extends AddShipmentState {}

class SuccessFetchAllDriver extends AddShipmentState {
  List<AllDrevierModel> allDriver;
  SuccessFetchAllDriver({
    required this.allDriver,
  });
}

class NotGetDriver extends AddShipmentState {
  String message;
  NotGetDriver({
    required this.message,
  });
}

class LoadingDriv extends AddShipmentState {}
class SuccessAddShipment extends AddShipmentState {
  String message;
  SuccessAddShipment({
    required this.message,
  });
}
class NotAddedShipment extends AddShipmentState{
   String message;
  NotAddedShipment({
    required this.message,
  });
}
class LoadingAdd extends AddShipmentState{}