import 'package:core/domain/entities/group_list.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class GetGroupListResponse extends Equatable {
  final Meta meta;
  final List<GroupList> data;

  const GetGroupListResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
