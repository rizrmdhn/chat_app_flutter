import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/friend_message.dart';
import 'package:equatable/equatable.dart';

class FriendMessageModel extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final bool isRead;
  final bool isEdited;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final UserModel sender;
  final UserModel receiver;

  const FriendMessageModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.isRead,
    required this.isEdited,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
    required this.receiver,
  });

  factory FriendMessageModel.fromJson(Map<String, dynamic> json) =>
      FriendMessageModel(
        id: json['id'] as String,
        senderId: json['sender_id'] as String,
        receiverId: json['receiver_id'] as String,
        message: json['message'] as String,
        isRead: json['is_read'] as bool,
        isEdited: json['is_edited'] as bool,
        isDeleted: json['is_deleted'] as bool,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
        receiver: UserModel.fromJson(json['receiver'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sender_id': senderId,
        'receiver_id': receiverId,
        'message': message,
        'is_read': isRead,
        'is_edited': isEdited,
        'is_deleted': isDeleted,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'sender': sender.toJson(),
        'receiver': receiver.toJson(),
      };

  FriendMessage toEntity() => FriendMessage(
        id: id,
        senderId: senderId,
        receiverId: receiverId,
        message: message,
        isRead: isRead,
        isEdited: isEdited,
        isDeleted: isDeleted,
        createdAt: createdAt,
        updatedAt: updatedAt,
        sender: sender.toEntity(),
        receiver: receiver.toEntity(),
      );

  @override
  List<Object?> get props => [
        id,
        senderId,
        receiverId,
        message,
        isRead,
        isEdited,
        isDeleted,
        createdAt,
        updatedAt,
        sender,
        receiver,
      ];
}
