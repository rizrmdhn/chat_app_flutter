import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/register_response.dart';
import 'package:equatable/equatable.dart';

class RegisterResponseModel extends Equatable {
  final MetaModel meta;
  final UserModel data;

  const RegisterResponseModel({
    required this.meta,
    required this.data,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: UserModel.fromJson(json['data']),
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
