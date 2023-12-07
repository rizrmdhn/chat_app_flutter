import 'package:core/domain/entities/role.dart';
import 'package:equatable/equatable.dart';

class UserRole extends Equatable {
  final String roleId;
  final String memberId;
  final Role role;

  const UserRole({
    required this.roleId,
    required this.memberId,
    required this.role,
  });

  @override
  List<Object?> get props => [roleId, memberId, role];
}
