import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_warehouse_managment/core/domain/warehouseInfo.dart';

part 'warehouses_event.dart';
part 'warehouses_state.dart';

class WarehousesBloc extends Bloc<WarehousesEvent, WarehousesState> {
  WarehousesBloc() : super(WarehousesInitial()) {
    on<WarehousesEvent>((event, emit) {
 
    });
  }
}
