import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/add_item_in_inventory.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';

part 'add_product_to_inventory_event.dart';
part 'add_product_to_inventory_state.dart';

class AddProductToInventoryBloc extends Bloc<AddProductToInventoryEvent, AddProductToInventoryState> {
  AddProductToInventoryBloc() : super(AddProductToInventoryInitial()) {
    on<AddItem>((event, emit) async{
      emit(Loading());
      String data;
       try{
       data= await InventoryServiceImpl().addProductToInventory(event.item, event.image);
        emit(SuccessAddItem(message: data));
      }catch(e){
        emit(NoConnection(message: e.toString()));
      }
    });
  }
}
