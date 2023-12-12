part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class Login extends LoginEvent {
  final String username;
  final String password;

  Login(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}
