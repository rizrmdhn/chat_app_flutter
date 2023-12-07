import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final Meta meta;
  final RegisterData data;

  const RegisterResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class RegisterData extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RegisterData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        password,
        createdAt,
        updatedAt,
      ];
}
