import 'package:core/domain/entities/message_group.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class UpdateGroupMessageResponse extends Equatable {
  final Meta meta;
  final MessageGroup data;

  const UpdateGroupMessageResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
