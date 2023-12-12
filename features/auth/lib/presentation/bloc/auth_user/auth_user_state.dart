part of 'auth_user_bloc.dart';

abstract class AuthUserState extends Equatable {
  const AuthUserState();

  @override
  List<Object?> get props => [];
}

class AuthUserInitial extends AuthUserState {}

class AuthUserLoading extends AuthUserState {}

class AuthUserLoaded extends AuthUserState {
  final User authUser;

  const AuthUserLoaded(this.authUser);

  @override
  List<Object?> get props => [authUser];
}

class AuthUserError extends AuthUserState {
  final String message;

  const AuthUserError(this.message);

  @override
  List<Object?> get props => [message];
}
