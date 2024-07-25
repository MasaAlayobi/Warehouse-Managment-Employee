// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'warehouses_bloc.dart';

@immutable
sealed class WarehousesState {}

final class WarehousesInitial extends WarehousesState {}

class SuccessGetWarehouses extends WarehousesState {
  List<WarehouseInfoModel> listWarehouseInState;
  SuccessGetWarehouses({
    required this.listWarehouseInState,
  });
}
class FailedGetWarehouse extends WarehousesState{}
class LoadedGetWarehouse extends WarehousesState{}
