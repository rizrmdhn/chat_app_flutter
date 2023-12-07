import 'package:core/domain/entities/Group.dart';
import 'package:equatable/equatable.dart';

class GroupModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String groupImage;
  final bool isPrivate;
  final String inviteLink;
  final String createdBy;
  final String updatedBy;
  final String createdAt;
  final String updatedAt;

  const GroupModel({
    required this.id,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.isPrivate,
    required this.inviteLink,
    required this.createdBy,
    required this.updatedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        groupImage: json['group_image'] as String,
        isPrivate: json['is_private'] as bool,
        inviteLink: json['invite_link'] as String,
        createdBy: json['created_by'] as String,
        updatedBy: json['updated_by'] as String,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'group_image': groupImage,
        'is_private': isPrivate,
        'invite_link': inviteLink,
        'created_by': createdBy,
        'updated_by': updatedBy,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  Group toEntity() => Group(
        id: id,
        name: name,
        description: description,
        groupImage: groupImage,
        isPrivate: isPrivate,
        inviteLink: inviteLink,
        createdBy: createdBy,
        updatedBy: updatedBy,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        isPrivate,
        inviteLink,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
      ];
}
