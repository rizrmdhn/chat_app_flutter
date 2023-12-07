import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/group_mesasge_list.dart';
import 'package:equatable/equatable.dart';

class GroupMessageListModel extends Equatable {
  final String id;
  final String groupId;
  final String senderId;
  final Object? readBy;
  final String message;
  final bool isRead;
  final bool isEdited;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final UserModel sender;

  const GroupMessageListModel({
    required this.id,
    required this.groupId,
    required this.senderId,
    required this.readBy,
    required this.message,
    required this.isRead,
    required this.isEdited,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.sender,
  });

  factory GroupMessageListModel.fromJson(Map<String, dynamic> json) =>
      GroupMessageListModel(
        id: json['id'] as String,
        groupId: json['group_id'] as String,
        senderId: json['sender_id'] as String,
        readBy: json['read_by'] as Object?,
        message: json['message'] as String,
        isRead: json['is_read'] as bool,
        isEdited: json['is_edited'] as bool,
        isDeleted: json['is_deleted'] as bool,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'group_id': groupId,
        'sender_id': senderId,
        'read_by': readBy,
        'message': message,
        'is_read': isRead,
        'is_edited': isEdited,
        'is_deleted': isDeleted,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'sender': sender.toJson(),
      };

  GroupMessageList toEntity() => GroupMessageList(
        id: id,
        groupId: groupId,
        senderId: senderId,
        readBy: readBy,
        message: message,
        isRead: isRead,
        isEdited: isEdited,
        isDeleted: isDeleted,
        createdAt: createdAt,
        updatedAt: updatedAt,
        sender: sender.toEntity(),
      );

  @override
  List<Object?> get props => [
        id,
        groupId,
        senderId,
        readBy,
        message,
        isRead,
        isEdited,
        isDeleted,
        createdAt,
        updatedAt,
        sender,
      ];
}
