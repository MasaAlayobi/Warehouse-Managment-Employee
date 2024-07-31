// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'items_stripped_bloc.dart';

@immutable
sealed class ItemsStrippedState {}

final class ItemsStrippedInitial extends ItemsStrippedState {}
class SuccessFetchItem extends ItemsStrippedState {
  List<ItemInStripped> allProduct;
  SuccessFetchItem({
    required this.allProduct,
  });
}
class NoConnection extends ItemsStrippedState {
  String message;
  NoConnection({
    required this.message,
  });
}
class Loading extends ItemsStrippedState{}
class SuccessDelete extends ItemsStrippedState {
  String message;
  SuccessDelete({
    required this.message,
  });
}
class ErrorInDelete extends ItemsStrippedState {
  String message;
  ErrorInDelete({
    required this.message,
  });
}