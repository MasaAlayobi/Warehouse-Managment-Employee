import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/all_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'all_shipment_event.dart';
part 'all_shipment_state.dart';

class AllShipmentBloc extends Bloc<AllShipmentEvent, AllShipmentState> {
  AllShipmentBloc() : super(AllShipmentInitial()) {
    on<GetAllShipment>((event, emit) async{
      emit(Loading());
      try{
        dynamic data=await SalesManageServiceImp().AllShipment();
        if(data.isNotEmpty){
        emit(SuccessFetchAllShipment(allShipment: data));

        }
        else{
         emit(NoConnection(message:'The inventory is empty')); 
        }
       }catch(e){
        emit(NoConnection(message: e.toString()));
       }
    });
  }
}
