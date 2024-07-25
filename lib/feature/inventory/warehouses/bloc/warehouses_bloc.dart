import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseInfo.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';

part 'warehouses_event.dart';
part 'warehouses_state.dart';

class WarehousesBloc extends Bloc<WarehousesEvent, WarehousesState> {
  WarehousesBloc() : super(WarehousesInitial()) {
    on<WarehousesEvent>((event, emit) async {
      emit(LoadedGetWarehouse());
      var response = await InventoryServiceImpl().getAllWarehouses();
      if (!response) {
        List<WarehouseInfoModel> ware = List.generate(response.length,
            (index) => WarehouseInfoModel.fromJson(response[index]));
        emit(SuccessGetWarehouses(listWarehouseInState: ware));
      } else {
        emit(FailedGetWarehouse());
      }
    });
  }
}
