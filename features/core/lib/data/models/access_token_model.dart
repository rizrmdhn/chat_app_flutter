import 'package:core/domain/entities/access_token.dart';
import 'package:equatable/equatable.dart';

class AccessTokenModel extends Equatable {
  final String type;
  final String token;
  final DateTime expiresAt;

  const AccessTokenModel({
    required this.type,
    required this.token,
    required this.expiresAt,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      AccessTokenModel(
        type: json['type'],
        token: json['token'],
        expiresAt: DateTime.parse(json['expires_at']),
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'token': token,
        'expires_at': expiresAt.toIso8601String(),
      };

  AccessToken toEntity() => AccessToken(
        type: type,
        token: token,
        expiresAt: expiresAt,
      );

  @override
  List<Object?> get props => [type, token, expiresAt];
}
