part of 'products_in_ware_bloc.dart';

@immutable
sealed class ProductsInWareState {}

final class ProductsInWareInitial extends ProductsInWareState {}
class SuccessGetProducts extends ProductsInWareState {
ProductwithveicleinwareModel listProductInWareInState;
  SuccessGetProducts({
    required this.listProductInWareInState,
  });
}
class FailedGetProducts extends ProductsInWareState{}
class LoadedGetProducts extends ProductsInWareState{}
class EmptyGetProducts extends ProductsInWareState{}