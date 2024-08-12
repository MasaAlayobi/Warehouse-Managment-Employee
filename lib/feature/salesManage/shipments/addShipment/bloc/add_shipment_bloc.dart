import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_shipment_event.dart';
part 'add_shipment_state.dart';

class AddShipmentBloc extends Bloc<AddShipmentEvent, AddShipmentState> {
  AddShipmentBloc() : super(AddShipmentInitial()) {
    on<AddShipmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
