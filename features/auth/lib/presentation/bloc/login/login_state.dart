part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final AccessToken accessToken;

  const LoginLoaded(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}

class LoginUserLoaded extends LoginState {
  final User user;

  const LoginUserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object?> get props => [message];
}
