// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_of_client_bloc.dart';

@immutable
sealed class DetailOfClientState {}

final class DetailOfClientInitial extends DetailOfClientState {}

class SuccessgetDetailsClient extends DetailOfClientState {
  DetailsacleintModel detailsClient;
  SuccessgetDetailsClient({
    required this.detailsClient,
  });
}

class FailedgetDetailsClient extends DetailOfClientState {}

class LoadedgetDetailsClient extends DetailOfClientState {}
