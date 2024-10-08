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
         emit(NoConnectionWithAllShipment(message:'The inventory is empty')); 
        }
       }catch(e){
        emit(NoConnectionWithAllShipment(message: e.toString()));
       }
    });
     on<ChangeShipmentStatus>((event, emit) async{
      emit(LoadingChange());
      String data;
        try{
       data= await SalesManageServiceImp().ChangeShipmentStatus(event.shipmentId, event.status);
        emit(SuccessChangeShipmentStatus(message: data));
      }catch(e){
        emit(NoConnectionWithChangeShipment(message: e.toString()));
      }
    });
  }
}
