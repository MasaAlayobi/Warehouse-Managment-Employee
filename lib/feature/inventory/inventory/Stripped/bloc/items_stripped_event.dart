// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'items_stripped_bloc.dart';

@immutable
sealed class ItemsStrippedEvent {}
class GetAllItemInStripped extends ItemsStrippedEvent{}
class DeleteItem extends ItemsStrippedEvent {
  int Id;
  DeleteItem({
    required this.Id,
  });
}
