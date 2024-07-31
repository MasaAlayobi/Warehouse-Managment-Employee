// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_product_to_inventory_bloc.dart';

@immutable
sealed class AddProductToInventoryEvent {}
class AddItem extends AddProductToInventoryEvent {
  AddItemInInventory item;
  File image;
  AddItem({
    required this.item,
    required this.image,
  });
}
