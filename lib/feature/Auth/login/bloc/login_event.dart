part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class loginUser extends LoginEvent {
  LoginModel User;
  loginUser({
    required this.User,
  });
}