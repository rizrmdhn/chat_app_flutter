part of 'auth_user_bloc.dart';

abstract class AuthUserEvent extends Equatable {}

class LoadAuthUser extends AuthUserEvent {
  final String accessToken;

  LoadAuthUser(this.accessToken);

  @override
  List<Object?> get props => [accessToken];
}
