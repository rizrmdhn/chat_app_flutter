import 'package:core/data/models/role_model.dart';
import 'package:core/domain/entities/user_role.dart';
import 'package:equatable/equatable.dart';

class UserRoleModel extends Equatable {
  final String roleId;
  final String memberId;
  final RoleModel role;

  const UserRoleModel({
    required this.roleId,
    required this.memberId,
    required this.role,
  });

  factory UserRoleModel.fromJson(Map<String, dynamic> json) => UserRoleModel(
        roleId: json['role_id'] as String,
        memberId: json['member_id'] as String,
        role: RoleModel.fromJson(json['role'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'role_id': roleId,
        'member_id': memberId,
        'role': role.toJson(),
      };

  UserRole toEntity() => UserRole(
        roleId: roleId,
        memberId: memberId,
        role: role.toEntity(),
      );

  @override
  List<Object?> get props => [roleId, memberId, role];
}
