import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/group_message.dart';
import 'package:equatable/equatable.dart';

class GroupMessageModel extends Equatable {
  final String message;
  final String groupId;
  final String senderId;
  final UserModel sender;

  const GroupMessageModel({
    required this.message,
    required this.groupId,
    required this.senderId,
    required this.sender,
  });

  factory GroupMessageModel.fromJson(Map<String, dynamic> json) =>
      GroupMessageModel(
        message: json['message'] as String,
        groupId: json['group_id'] as String,
        senderId: json['sender_id'] as String,
        sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'group_id': groupId,
        'sender_id': senderId,
        'sender': sender.toJson(),
      };

  GroupMessage toEntity() => GroupMessage(
        message: message,
        groupId: groupId,
        senderId: senderId,
        sender: sender.toEntity(),
      );

  @override
  List<Object?> get props => [message, groupId, senderId, sender];
}
