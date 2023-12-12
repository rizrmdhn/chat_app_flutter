part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {}

class Register extends RegisterEvent {
  final String name;
  final String username;
  final String email;
  final String password;

  Register(this.name, this.username, this.email, this.password);

  @override
  List<Object?> get props => [name, username, email, password];
}
