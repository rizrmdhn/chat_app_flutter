import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/sent_friend_request_response.dart';
import 'package:equatable/equatable.dart';

class SentFriendRequestResponseModel extends Equatable {
  final MetaModel meta;
  final SentFriendRequestDataModel data;

  const SentFriendRequestResponseModel({
    required this.meta,
    required this.data,
  });

  factory SentFriendRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      SentFriendRequestResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: SentFriendRequestDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  SentFriendRequestResponse toEntity() => SentFriendRequestResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class SentFriendRequestDataModel extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String createdAt;
  final String updatedAt;

  const SentFriendRequestDataModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SentFriendRequestDataModel.fromJson(Map<String, dynamic> json) =>
      SentFriendRequestDataModel(
        id: json['id'],
        senderId: json['sender_id'],
        receiverId: json['receiver_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sender_id': senderId,
        'receiver_id': receiverId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  SentFriendRequestData toEntity() => SentFriendRequestData(
        id: id,
        senderId: senderId,
        receiverId: receiverId,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [id, senderId, receiverId, createdAt, updatedAt];
}
