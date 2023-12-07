import 'package:core/data/models/group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/update_group_response.dart';
import 'package:equatable/equatable.dart';

class UpdateGroupResponseModel extends Equatable {
  final MetaModel meta;
  final GroupModel data;

  const UpdateGroupResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateGroupResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: GroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateGroupResponse toEntity() => UpdateGroupResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
