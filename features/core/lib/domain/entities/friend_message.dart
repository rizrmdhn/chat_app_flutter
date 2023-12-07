import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class FriendMessage extends Equatable {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final bool isRead;
  final bool isEdited;
  final bool isDeleted;
  final String createdAt;
  final String updatedAt;
  final User sender;
  final User receiver;

  const FriendMessage({
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
