import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/add_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/data/all_drevier_model.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'add_shipment_event.dart';
part 'add_shipment_state.dart';

class AddShipmentBloc extends Bloc<AddShipmentEvent, AddShipmentState> {
  AddShipmentBloc() : super(AddShipmentInitial()) {
    on<GetAllDriver>((event, emit) async{
            emit(LoadingDriv());
       try{
        dynamic data=await SalesManageServiceImp().AllDriver();
        if(data.isNotEmpty){
        emit(SuccessFetchAllDriver(allDriver: data));

        }
        else{
         emit(NotGetDriver(message:'The inventory is empty')); 
        }
       }catch(e){
        emit(NotGetDriver(message: e.toString()));
       }
    });
     on<AddShipment>((event, emit) async{
      emit(LoadingAdd());
      String data;
       try{
       data= await SalesManageServiceImp().AddShipment(event.shipment);
        emit(SuccessAddShipment(message: data));
      }catch(e){
        emit(NotAddedShipment(message: e.toString()));
      }
    });
  }
}
