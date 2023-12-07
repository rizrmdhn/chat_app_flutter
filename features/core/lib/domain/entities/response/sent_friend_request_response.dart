import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class SentFriendRequestResponse extends Equatable {
  final Meta meta;
  final SentFriendRequestData data;

  const SentFriendRequestResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class SentFriendRequestData extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String createdAt;
  final String updatedAt;

  const SentFriendRequestData({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, senderId, receiverId, createdAt, updatedAt];
}
