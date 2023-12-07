import 'package:core/data/models/group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/update_group_image_response.dart';
import 'package:equatable/equatable.dart';

class UpdateGroupImageResponseModel extends Equatable {
  final MetaModel meta;
  final GroupModel data;

  const UpdateGroupImageResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateGroupImageResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateGroupImageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: GroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateGroupImageResponse toEntity() => UpdateGroupImageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
