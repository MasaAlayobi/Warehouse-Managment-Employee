import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/purchaseOrder.dart';
import 'package:mobile_warehouse_managment/core/domain/purchase_service.dart';

part 'purchase_order_event.dart';
part 'purchase_order_state.dart';

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  PurchaseOrderBloc() : super(PurchaseOrderInitial()) {
    on<GetPurchaseOrderEvent>((event, emit) async {
      emit(LoadedGetPurchase());
      var response = await purchaseServiceImpl().showAllorder();
      List<AllPurchaseOrderModel> temp = List.generate(response.length,
          (index) => AllPurchaseOrderModel.fromMap(response[index]));
      print(temp);

      try {
        if (temp.isNotEmpty) {
          emit(SuccessGetPurchase(listWarehouseInState: temp));
        } else {
          emit(EmptyGetPurchase());
        }
      } catch (e) {
        emit(FailedGetPurchase());
      }
    });
  }
}
