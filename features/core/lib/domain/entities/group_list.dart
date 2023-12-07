import 'package:core/domain/entities/group_message.dart';
import 'package:equatable/equatable.dart';

class GroupList extends Equatable {
  final String id;
  final String name;
  final String description;
  final String groupImage;
  final bool isPrivate;
  final List<GroupMessage> groupMessages;

  const GroupList({
    required this.id,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.isPrivate,
    required this.groupMessages,
  });

  @override
  List<Object?> get props =>
      [id, name, description, groupImage, isPrivate, groupMessages];
}
