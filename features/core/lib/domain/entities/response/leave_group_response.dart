import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class LeaveGroupResponse extends Equatable {
  final Meta meta;

  const LeaveGroupResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
