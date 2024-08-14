import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/HollModelDetailsAnOrderPurchase.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/detailsOrderPurchase.dart';
import 'package:mobile_warehouse_managment/core/domain/purchase_service.dart';

part 'details_of_order_puchase_event.dart';
part 'details_of_order_puchase_state.dart';

class DetailsOfOrderPuchaseBloc
    extends Bloc<DetailsOfOrderPuchaseEvent, DetailsOfOrderPuchaseState> {
  DetailsOfOrderPuchaseBloc() : super(DetailsOfOrderPuchaseInitial()) {
    emit(LoadedGetDetailsPurchase());
    on<GetDetailsPurchaseOrder>((event, emit) async {
      // try {
      var response =
          await purchaseServiceImpl().showDetailsAnOrderPurchase(event.id);
      var temp = HollModelOfDetailsOrderPurchase.fromMap(response);
      emit(SuccessGetDetailsPurchase(detailsOrderInState: temp));
      // } catch (e) {
      //   emit(FailedGetDetailsPurchase());
      // }
    });
  }
}
