import 'package:core/domain/entities/message_group.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class SendGroupMessageResponse extends Equatable {
  final Meta meta;
  final MessageGroup data;

  const SendGroupMessageResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
