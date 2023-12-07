import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/join_group_response.dart';
import 'package:equatable/equatable.dart';

class JoinGroupResponseModel extends Equatable {
  final MetaModel meta;
  final JoinGroupDataModel data;

  const JoinGroupResponseModel({
    required this.meta,
    required this.data,
  });

  factory JoinGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      JoinGroupResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: JoinGroupDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  JoinGroupResponse toEntity() => JoinGroupResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class JoinGroupDataModel extends Equatable {
  final String id;
  final String groupId;
  final String createdAt;
  final String updatedAt;

  const JoinGroupDataModel({
    required this.id,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JoinGroupDataModel.fromJson(Map<String, dynamic> json) =>
      JoinGroupDataModel(
        id: json['id'],
        groupId: json['group_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'group_id': groupId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  JoinGroupData toEntity() => JoinGroupData(
        id: id,
        groupId: groupId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, groupId, createdAt, updatedAt];
}
