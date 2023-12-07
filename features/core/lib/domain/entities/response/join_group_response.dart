import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class JoinGroupResponse extends Equatable {
  final Meta meta;
  final JoinGroupData data;

  const JoinGroupResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class JoinGroupData extends Equatable {
  final String id;
  final String groupId;
  final String createdAt;
  final String updatedAt;

  const JoinGroupData({
    required this.id,
    required this.groupId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, groupId, createdAt, updatedAt];
}
