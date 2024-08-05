// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_in_ware_bloc.dart';

@immutable
sealed class ProductsInWareEvent {}

class GetAllProductsInWare extends ProductsInWareEvent {
  int id;
  GetAllProductsInWare({
    required this.id,
  });
}
