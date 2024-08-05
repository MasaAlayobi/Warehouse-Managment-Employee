import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/data/warehouseInfo.dart';
import 'package:mobile_warehouse_managment/core/domain/inventory_service.dart';

part 'warehouses_event.dart';
part 'warehouses_state.dart';

class WarehousesBloc extends Bloc<WarehousesEvent, WarehousesState> {
  WarehousesBloc() : super(WarehousesInitial()) {
    on<GetAllWarehouses>((event, emit) async {
      emit(LoadedGetWarehouse());
      var response = await InventoryServiceImpl().getAllWarehouses();

      List<WarehouseInfoModel> ware = List.generate(response.length,
          (index) => WarehouseInfoModel.fromMap(response[index]));
      print(ware);
      if (ware.isNotEmpty) {
        emit(SuccessGetWarehouses(listWarehouseInState: ware));
      } else if (ware.isEmpty) {
        emit(EmptyGetWarehouse());
      } else {
        emit(FailedGetWarehouse());
      }
    });
  }
}
