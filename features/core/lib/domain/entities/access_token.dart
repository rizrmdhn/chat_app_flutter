import 'package:equatable/equatable.dart';

class AccessToken extends Equatable {
  final String type;
  final String token;
  final DateTime expiresAt;

  const AccessToken({
    required this.type,
    required this.token,
    required this.expiresAt,
  });

  @override
  List<Object?> get props => [type, token, expiresAt];
}
