import 'package:core/domain/entities/Group.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class CreateGroupResponse extends Equatable {
  final Meta meta;
  final Group data;

  const CreateGroupResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
