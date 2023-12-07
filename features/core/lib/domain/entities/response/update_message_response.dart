import 'package:core/domain/entities/message_friend.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class UpdateMessageResponse extends Equatable {
  final Meta meta;
  final MessageFriend data;

  const UpdateMessageResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
