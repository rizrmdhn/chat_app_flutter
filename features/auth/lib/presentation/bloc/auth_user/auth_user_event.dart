part of 'auth_user_bloc.dart';

abstract class AuthUserEvent extends Equatable {}

class LoadAuthUser extends AuthUserEvent {
  @override
  List<Object?> get props => [];
}

class RefreshAuthUser extends AuthUserEvent {
  @override
  List<Object?> get props => [];
}
