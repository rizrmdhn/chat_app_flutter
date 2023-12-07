import 'package:core/data/models/group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/create_group_response.dart';
import 'package:equatable/equatable.dart';

class CreateGroupResponseModel extends Equatable {
  final MetaModel meta;
  final GroupModel data;

  const CreateGroupResponseModel({
    required this.meta,
    required this.data,
  });

  factory CreateGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      CreateGroupResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: GroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  CreateGroupResponse toEntity() => CreateGroupResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
