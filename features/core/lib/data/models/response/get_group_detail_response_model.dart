import 'package:core/data/models/group_member_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/get_group_detail_response.dart';
import 'package:equatable/equatable.dart';

class GetGroupDetailResponseModel extends Equatable {
  final MetaModel meta;
  final GetGroupDetailDataModel data;

  const GetGroupDetailResponseModel({
    required this.meta,
    required this.data,
  });

  factory GetGroupDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      GetGroupDetailResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: GetGroupDetailDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  GetGroupDetailResponse toEntity() => GetGroupDetailResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object> get props => [meta, data];
}

class GetGroupDetailDataModel extends Equatable {
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
  final UserModel creator;
  final UserModel updater;
  final GroupMemberModel groupMembers;

  const GetGroupDetailDataModel({
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
    required this.creator,
    required this.updater,
    required this.groupMembers,
  });

  factory GetGroupDetailDataModel.fromJson(Map<String, dynamic> json) =>
      GetGroupDetailDataModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        groupImage: json['group_image'],
        isPrivate: json['is_private'],
        inviteLink: json['invite_link'],
        createdBy: json['created_by'],
        updatedBy: json['updated_by'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        creator: UserModel.fromJson(json['creator']),
        updater: UserModel.fromJson(json['updater']),
        groupMembers: GroupMemberModel.fromJson(json['group_members']),
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
        'creator': creator.toJson(),
        'updater': updater.toJson(),
        'group_members': groupMembers.toJson(),
      };

  GetGroupDetailData toEntity() => GetGroupDetailData(
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
        creator: creator.toEntity(),
        updater: updater.toEntity(),
        groupMembers: groupMembers.toEntity(),
      );

  @override
  List<Object> get props => [
        id,
        name,
        description,
        groupImage,
        isPrivate,
        inviteLink,
        createdBy,
        updatedBy,
        createdAt,
        updatedAt,
        creator,
        updater,
        groupMembers,
      ];
}
