import 'package:core/data/models/access_token_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/login_response.dart';
import 'package:equatable/equatable.dart';

class LoginResponseModel extends Equatable {
  final MetaModel meta;
  final AccessTokenModel data;

  const LoginResponseModel({
    required this.meta,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: AccessTokenModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  LoginResponse toEntity() => LoginResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
