import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/update_user_about_me_response.dart';
import 'package:equatable/equatable.dart';

class UpdateUserAboutMeResponseModel extends Equatable {
  final MetaModel meta;
  final UserModel data;

  const UpdateUserAboutMeResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateUserAboutMeResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateUserAboutMeResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: UserModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateUserAboutMeResponse toEntity() => UpdateUserAboutMeResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
