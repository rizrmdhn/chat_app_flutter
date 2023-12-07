import 'package:core/domain/entities/group_member.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class GetGroupDetailResponse extends Equatable {
  final Meta meta;
  final GetGroupDetailData data;

  const GetGroupDetailResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object> get props => [meta, data];
}

class GetGroupDetailData extends Equatable {
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
  final User creator;
  final User updater;
  final GroupMember groupMembers;

  const GetGroupDetailData({
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
