import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/all_supplier_model.dart';
import 'package:mobile_warehouse_managment/core/domain/supplier_service.dart';

part 'all_supplier_event.dart';
part 'all_supplier_state.dart';

class AllSupplierBloc extends Bloc<AllSupplierEvent, AllSupplierState> {
  AllSupplierBloc() : super(AllSupplierInitial()) {
    on<GetAllSupplier>((event, emit) async{
      emit(Loading());
      try{
        dynamic data=await SupplierServiceImp().AllSupplier();
        if(data.isNotEmpty){
        emit(SuccessFetchAllSupplier(allSupplier: data));

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
