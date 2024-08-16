import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/previous_sale_shipment_model.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'previous_sale_event.dart';
part 'previous_sale_state.dart';

class PreviousSaleBloc extends Bloc<PreviousSaleEvent, PreviousSaleState> {
  PreviousSaleBloc() : super(PreviousSaleInitial()) {
    on<GetAllPreviousSale>((event, emit) async{
            emit(Loading());
       try{
        dynamic data=await SalesManageServiceImp().AllPreviousSaleOrder();
        if(data.isNotEmpty){
        emit(SuccessFetchPreviousSale(shipment: data));

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
