import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String username;
  final String? email;
  final String status;
  final String aboutMe;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.status,
    required this.aboutMe,
    required this.avatar,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        username,
        email,
        status,
        aboutMe,
        avatar,
      ];
}
