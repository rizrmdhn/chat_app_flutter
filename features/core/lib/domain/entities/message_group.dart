import 'package:equatable/equatable.dart';

class MessageGroup extends Equatable {
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

  const MessageGroup({
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
  });

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
      ];
}
