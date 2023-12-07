import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class GroupList extends Equatable {
  final String id;
  final String name;
  final String description;
  final String groupImage;
  final bool isPrivate;
  final String message;
  final String messageCreatedAt;
  final User sender;

  const GroupList({
    required this.id,
    required this.name,
    required this.description,
    required this.groupImage,
    required this.isPrivate,
    required this.message,
    required this.messageCreatedAt,
    required this.sender,
  });

  @override
  List<Object?> get props =>
      [id, name, description, groupImage, isPrivate, sender];
}
