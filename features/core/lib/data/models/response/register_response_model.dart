import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/register_response.dart';
import 'package:equatable/equatable.dart';

class RegisterResponseModel extends Equatable {
  final MetaModel meta;
  final RegisterDataModel data;

  const RegisterResponseModel({
    required this.meta,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: RegisterDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  RegisterResponse toEntity() => RegisterResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class RegisterDataModel extends Equatable {
  final String id;
  final String name;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final DateTime updatedAt;

  const RegisterDataModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  RegisterData toEntity() => RegisterData(
        id: id,
        name: name,
        username: username,
        email: email,
        password: password,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

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
