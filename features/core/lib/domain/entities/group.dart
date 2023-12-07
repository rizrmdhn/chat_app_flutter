import 'package:equatable/equatable.dart';

class Group extends Equatable {
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

  const Group({
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
