part of 'customers_bloc.dart';

@immutable
sealed class CustomersState {}

final class CustomersInitial extends CustomersState {}

class SuccessGetCustomers extends CustomersState {
  List<CustomerinfoModel> customersList;
  SuccessGetCustomers({
    required this.customersList,
  });
}

class FailedGetCustomers extends CustomersState {}

class LoadedGetCustomers extends CustomersState {}

class EmptyGetCustomers extends CustomersState {}
