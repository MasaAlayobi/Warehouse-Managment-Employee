import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/item_in_stripped.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';

part 'items_stripped_event.dart';
part 'items_stripped_state.dart';

class ItemsStrippedBloc extends Bloc<ItemsStrippedEvent, ItemsStrippedState> {
  ItemsStrippedBloc() : super(ItemsStrippedInitial()) {
    on<GetAllItemInStripped>((event, emit) async{
      emit(Loading());
       try{
        dynamic data=await InventoryServiceImpl().getItemInStripped();
        if(data.isNotEmpty){
        emit(SuccessFetchItem(allProduct: data));

        }
        else{
         emit(NoConnection(message:'The inventory is empty')); 
        }
       }catch(e){
        emit(NoConnection(message: e.toString()));
       }
    });
    on<DeleteItem>((event, emit) async{
       try {
         String data =await InventoryServiceImpl().DeletItem(event.Id);
         emit(SuccessDelete(message: data));
       } catch (e) {
         emit(ErrorInDelete(message: e.toString()));
       }
    });
  }
}
