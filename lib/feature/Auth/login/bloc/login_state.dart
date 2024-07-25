part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class successlogin extends LoginState {
   String message;
  
  successlogin({
    required this.message,
    
  });
}

class InformationError extends LoginState {
  String message;
  InformationError({
    required this.message,
  });
}

class NoConnection extends LoginState {
  String message;
  NoConnection({
    required this.message,
  });
}

class loading extends LoginState {}