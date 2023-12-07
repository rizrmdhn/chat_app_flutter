import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class GroupMessage extends Equatable {
  final String message;
  final String groupId;
  final String senderId;
  final User sender;

  const GroupMessage({
    required this.message,
    required this.groupId,
    required this.senderId,
    required this.sender,
  });

  @override
  List<Object?> get props => [message, groupId, senderId, sender];
}
