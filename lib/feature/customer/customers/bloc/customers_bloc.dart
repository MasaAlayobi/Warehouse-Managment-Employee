import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/customerInfo.dart';
import 'package:mobile_warehouse_managment/core/domain/customer_service.dart';

part 'customers_event.dart';
part 'customers_state.dart';

class CustomersBloc extends Bloc<CustomersEvent, CustomersState> {
  CustomersBloc() : super(CustomersInitial()) {
    on<getCustomers>((event, emit) async {
      try {
        emit(LoadedGetCustomers());
        List<CustomerinfoModel> response =
            await CustomerServiceImpl().getCustomers();
        print(response);

        if (response.isNotEmpty) {
          emit(SuccessGetCustomers(customersList: response));
        } else if (response.isEmpty) {
          emit(EmptyGetCustomers());
        } else {
          emit(FailedGetCustomers());
        }
      } catch (e) {
        // print(e);
        throw (e);
      }
    });
  }
}
