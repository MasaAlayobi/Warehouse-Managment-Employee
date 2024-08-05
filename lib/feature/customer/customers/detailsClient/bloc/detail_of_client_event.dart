// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_of_client_bloc.dart';

@immutable
sealed class DetailOfClientEvent {}

class getDetailsClient extends DetailOfClientEvent {
  int id;
  getDetailsClient({
    required this.id,
  });
}
