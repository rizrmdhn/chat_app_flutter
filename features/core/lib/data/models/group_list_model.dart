import 'package:core/data/models/group_message_model.dart';
import 'package:core/domain/entities/group_list.dart';
import 'package:equatable/equatable.dart';

class GroupListModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String groupImage;
  final bool isPrivate;
  final List<GroupMessageModel> groupMessages;

  const GroupListModel({
    required this.id,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.isPrivate,
    required this.groupMessages,
  });

  factory GroupListModel.fromJson(Map<String, dynamic> json) => GroupListModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        groupImage: json['group_image'] as String,
        isPrivate: json['is_private'] as bool,
        groupMessages: (json['groupMessages'] as List<dynamic>)
            .map((e) => GroupMessageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'group_image': groupImage,
        'is_private': isPrivate,
        'groupMessages': groupMessages.map((e) => e.toJson()).toList(),
      };

  GroupList toEntity() => GroupList(
        id: id,
        name: name,
        description: description,
        groupImage: groupImage,
        isPrivate: isPrivate,
        groupMessages: groupMessages.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props =>
      [id, name, description, groupImage, isPrivate, groupMessages];
}
