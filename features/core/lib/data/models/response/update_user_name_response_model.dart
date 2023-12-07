import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/update_user_name_response.dart';
import 'package:equatable/equatable.dart';

class UpdateUserNameResponseModel extends Equatable {
  final MetaModel meta;
  final UserModel data;

  const UpdateUserNameResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateUserNameResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserNameResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: UserModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateUserNameResponse toEntity() => UpdateUserNameResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
