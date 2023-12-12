import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String username;
  final String? email;
  final String? status;
  final String? aboutMe;
  final String? avatar;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.status,
    required this.aboutMe,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as String,
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String?,
        status: json['status'] as String?,
        aboutMe: json['about_me'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'status': status,
        'about_me': aboutMe,
        'avatar': avatar,
      };

  User toEntity() => User(
        id: id,
        name: name,
        username: username,
        email: email,
        status: status,
        aboutMe: aboutMe,
        avatar: avatar,
      );

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
