// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_product_to_inventory_bloc.dart';

@immutable
sealed class AddProductToInventoryState {}

final class AddProductToInventoryInitial extends AddProductToInventoryState {}
class SuccessAddItem extends AddProductToInventoryState {
  String message;
  SuccessAddItem({
    required this.message,
  });
}
class Loading extends AddProductToInventoryState{}
class NoConnection extends AddProductToInventoryState{
  String message;
  NoConnection({
    required this.message,
  });
}