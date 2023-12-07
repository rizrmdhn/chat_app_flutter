import 'package:core/domain/entities/user.dart';
import 'package:core/domain/entities/user_role.dart';
import 'package:equatable/equatable.dart';

class GroupMember extends Equatable {
  final String memberId;
  final String groupId;
  final User user;
  final UserRole userRole;

  const GroupMember({
    required this.memberId,
    required this.groupId,
    required this.user,
    required this.userRole,
  });

  @override
  List<Object?> get props => [memberId, groupId, user, userRole];
}
