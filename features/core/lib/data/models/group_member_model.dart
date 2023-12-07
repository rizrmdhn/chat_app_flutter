import 'package:core/data/models/user_model.dart';
import 'package:core/data/models/user_role_model.dart';
import 'package:core/domain/entities/group_member.dart';
import 'package:equatable/equatable.dart';

class GroupMemberModel extends Equatable {
  final String memberId;
  final String groupId;
  final UserModel user;
  final UserRoleModel userRole;

  const GroupMemberModel({
    required this.memberId,
    required this.groupId,
    required this.user,
    required this.userRole,
  });

  factory GroupMemberModel.fromJson(Map<String, dynamic> json) =>
      GroupMemberModel(
        memberId: json['member_id'] as String,
        groupId: json['group_id'] as String,
        user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
        userRole:
            UserRoleModel.fromJson(json['userRole'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'member_id': memberId,
        'group_id': groupId,
        'user': user.toJson(),
        'userRole': userRole.toJson(),
      };

  GroupMember toEntity() => GroupMember(
        memberId: memberId,
        groupId: groupId,
        user: user.toEntity(),
        userRole: userRole.toEntity(),
      );

  @override
  List<Object?> get props => [memberId, groupId, user, userRole];
}
