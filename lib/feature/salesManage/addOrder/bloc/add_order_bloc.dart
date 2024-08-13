import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/add_sale_order.dart';
import 'package:mobile_warehouse_managment/core/data/warehouse_in_order_sale.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'add_order_event.dart';
part 'add_order_state.dart';

class AddOrderBloc extends Bloc<AddOrderEvent, AddOrderState> {
  AddOrderBloc() : super(AddOrderInitial()) {
    on<GetWarehousefromNeartoFar>((event, emit) async{
       emit(Loading());
       try{
        dynamic data=await SalesManageServiceImp().getWarehousefromNeartoFar(event.id);
        if(data.isNotEmpty){
        emit(SuccessFetchWarehouse(item: data));

        }
        else{
         emit(NoConnection(message:'The inventory is empty')); 
        }
       }catch(e){
        emit(NoConnection(message: e.toString()));
       }
    });
    on<AddSaleOrder>((event, emit) async{
      emit(Loading());
      String data;
       try{
       data= await SalesManageServiceImp().AddSaleOrder(event.order);
        emit(SuccessAddSaleOrder(message: data));
      }catch(e){
        emit(NoConnectionWithAdd(message: e.toString()));
      }
    });
  }
}
