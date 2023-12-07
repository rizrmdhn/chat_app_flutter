import 'package:core/domain/entities/message_friend.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class GetFriendMessageListResponse extends Equatable {
  final Meta meta;
  final List<MessageFriend> data;

  const GetFriendMessageListResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
