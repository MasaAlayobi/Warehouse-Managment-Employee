import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/detailsACleint.dart';
import 'package:mobile_warehouse_managment/core/domain/customer_service.dart';
import 'package:mobile_warehouse_managment/feature/customer/customers/bloc/customers_bloc.dart';

part 'detail_of_client_event.dart';
part 'detail_of_client_state.dart';

class DetailOfClientBloc
    extends Bloc<DetailOfClientEvent, DetailOfClientState> {
  DetailOfClientBloc() : super(DetailOfClientInitial()) {
    on<getDetailsClient>((event, emit) async {
      emit(LoadedgetDetailsClient());

      try {
        var response = await CustomerServiceImpl().getDetailToClient(event.id);
        var temp = DetailsacleintModel.fromMap(response);
        print("emit");
        print(temp);
        emit(SuccessgetDetailsClient(detailsClient: temp));
      } catch (e) {
        FailedGetCustomers();
        print(e);
        throw e;
      }
    });
  }
}
