import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/details_order_in_current_sale.dart';
import 'package:mobile_warehouse_managment/core/domain/sales_manage_service.dart';

part 'order_details_in_sale_event.dart';
part 'order_details_in_sale_state.dart';

class OrderDetailsInSaleBloc extends Bloc<OrderDetailsInSaleEvent, OrderDetailsInSaleState> {
  OrderDetailsInSaleBloc() : super(OrderDetailsInSaleInitial()) {
    on<GetDetailsSaleOrder>((event, emit) async{
     emit(Loading());
       try{
        dynamic data=await SalesManageServiceImp().ShowDetailsOrderInCurrentsale(event.id);
         var temp = DetailsOrderInCurrentSale.fromMap(data);
        if(temp.order!.items.isNotEmpty){
        emit(SuccessFetchSaleOrderDetails(order: temp));

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
