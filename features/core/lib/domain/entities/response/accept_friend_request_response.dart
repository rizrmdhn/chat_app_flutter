import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class AcceptFriendRequestResponse extends Equatable {
  final Meta meta;
  final AcceptFriendRequestData data;

  const AcceptFriendRequestResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class AcceptFriendRequestData extends Equatable {
  final String id;
  final String userId;
  final String friendId;
  final String createdAt;
  final String updatedAt;

  const AcceptFriendRequestData({
    required this.id,
    required this.userId,
    required this.friendId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, userId, friendId, createdAt, updatedAt];
}
