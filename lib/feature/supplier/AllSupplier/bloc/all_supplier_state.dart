// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_supplier_bloc.dart';

@immutable
sealed class AllSupplierState {}

final class AllSupplierInitial extends AllSupplierState {}
class SuccessFetchAllSupplier extends AllSupplierState {
  List<AllSupplierModel> allSupplier;
  SuccessFetchAllSupplier({
    required this.allSupplier,
  });
}
class Loading extends AllSupplierState{}
class NoConnection extends AllSupplierState {
  String message;
  NoConnection({
    required this.message,
  });
}
