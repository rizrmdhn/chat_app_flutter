import 'package:equatable/equatable.dart';

class MessageFriend extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final bool isRead;
  final bool isEdited;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;

  const MessageFriend({
    required this.id,
    required this.senderId,
    required this.receiverId,
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
        senderId,
        receiverId,
        message,
        isRead,
        isEdited,
        isDeleted,
        createdAt,
        updatedAt,
      ];
}
