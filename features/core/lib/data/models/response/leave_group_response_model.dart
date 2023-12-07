import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/leave_group_response.dart';
import 'package:equatable/equatable.dart';

class LeaveGroupResponseModel extends Equatable {
  final MetaModel meta;

  const LeaveGroupResponseModel({
    required this.meta,
  });

  factory LeaveGroupResponseModel.fromJson(Map<String, dynamic> json) =>
      LeaveGroupResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  LeaveGroupResponse toEntity() => LeaveGroupResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
