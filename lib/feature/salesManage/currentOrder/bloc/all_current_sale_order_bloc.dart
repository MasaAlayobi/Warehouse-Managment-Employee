import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/show_all_current_sale_order_model.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'all_current_sale_order_event.dart';
part 'all_current_sale_order_state.dart';

class AllCurrentSaleOrderBloc extends Bloc<AllCurrentSaleOrderEvent, AllCurrentSaleOrderState> {
  AllCurrentSaleOrderBloc() : super(AllCurrentSaleOrderInitial()) {
    on<GetAllCurrentSaleOrder>((event, emit) async{
      emit(Loading());
       try{
        dynamic data=await SalesManageServiceImp().AllSaleCurrentOrder();
        if(data.isNotEmpty){
        emit(SuccessfetchOrder(orders: data));

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
