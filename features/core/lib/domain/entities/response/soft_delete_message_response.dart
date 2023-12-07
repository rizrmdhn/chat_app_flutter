import 'package:core/domain/entities/message_friend.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class SoftDeleteMessageResponse extends Equatable {
  final Meta meta;
  final MessageFriend data;

  const SoftDeleteMessageResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
