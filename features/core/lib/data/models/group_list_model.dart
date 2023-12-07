import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/group_list.dart';
import 'package:equatable/equatable.dart';

class GroupListModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String groupImage;
  final bool isPrivate;
  final String message;
  final String messageCreatedAt;
  final UserModel sender;

  const GroupListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.isPrivate,
    required this.message,
    required this.messageCreatedAt,
    required this.sender,
  });

  factory GroupListModel.fromJson(Map<String, dynamic> json) => GroupListModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        groupImage: json['group_image'] as String,
        isPrivate: json['is_private'] as bool,
        message: json['message'] as String,
        messageCreatedAt: json['message_created_at'] as String,
        sender: UserModel.fromJson(json['sender'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'group_image': groupImage,
        'is_private': isPrivate,
        'sender': sender.toJson(),
      };

  GroupList toEntity() => GroupList(
        id: id,
        name: name,
        description: description,
        groupImage: groupImage,
        isPrivate: isPrivate,
        message: message,
        messageCreatedAt: messageCreatedAt,
        sender: sender.toEntity(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        groupImage,
        isPrivate,
        message,
        messageCreatedAt,
        sender
      ];
}
