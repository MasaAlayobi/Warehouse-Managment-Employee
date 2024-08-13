import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/purchase/detailsOrderPurchase.dart';
import 'package:mobile_warehouse_managment/core/domain/purchase_service.dart';

part 'details_of_order_puchase_event.dart';
part 'details_of_order_puchase_state.dart';

class DetailsOfOrderPuchaseBloc
    extends Bloc<DetailsOfOrderPuchaseEvent, DetailsOfOrderPuchaseState> {
  DetailsOfOrderPuchaseBloc() : super(DetailsOfOrderPuchaseInitial()) {
    on<GetDetailsPurchaseOrder>((event, emit) async {
      try {
        var response =
            await purchaseServiceImpl().showDetailsAnOrderPurchase(1);

        emit(SuccessGetDetailsPurchase(detailsOrderInState: response));
      } catch (e) {
        emit(FailedGetDetailsPurchase());
      }
    });
  }
}
