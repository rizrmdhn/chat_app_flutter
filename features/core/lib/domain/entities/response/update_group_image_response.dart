import 'package:core/domain/entities/Group.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class UpdateGroupImageResponse extends Equatable {
  final Meta meta;
  final Group data;

  const UpdateGroupImageResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
