import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/update_user_status_response.dart';
import 'package:equatable/equatable.dart';

class UpdateUserStatusResponseModel extends Equatable {
  final MetaModel meta;
  final UserModel data;

  const UpdateUserStatusResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateUserStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserStatusResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: UserModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateUserStatusResponse toEntity() => UpdateUserStatusResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
