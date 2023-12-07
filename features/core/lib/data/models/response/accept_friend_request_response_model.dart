import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/accept_friend_request_response.dart';
import 'package:equatable/equatable.dart';

class AcceptFriendRequestResponseModel extends Equatable {
  final MetaModel meta;
  final AcceptFriendRequestDataModel data;

  const AcceptFriendRequestResponseModel({
    required this.meta,
    required this.data,
  });

  factory AcceptFriendRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      AcceptFriendRequestResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: AcceptFriendRequestDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  AcceptFriendRequestResponse toEntity() => AcceptFriendRequestResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class AcceptFriendRequestDataModel extends Equatable {
  final String id;
  final String userId;
  final String friendId;
  final String createdAt;
  final String updatedAt;

  const AcceptFriendRequestDataModel({
    required this.id,
    required this.userId,
    required this.friendId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AcceptFriendRequestDataModel.fromJson(Map<String, dynamic> json) =>
      AcceptFriendRequestDataModel(
        id: json['id'],
        userId: json['user_id'],
        friendId: json['friend_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'friend_id': friendId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  AcceptFriendRequestData toEntity() => AcceptFriendRequestData(
        id: id,
        userId: userId,
        friendId: friendId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, userId, friendId, createdAt, updatedAt];
}
