import 'package:core/domain/entities/role.dart';
import 'package:equatable/equatable.dart';

class RoleModel extends Equatable {
  final String id;
  final String name;

  const RoleModel({
    required this.id,
    required this.name,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json['id'] as String,
        name: json['name'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  Role toEntity() => Role(
        id: id,
        name: name,
      );

  @override
  List<Object?> get props => [id, name];
}
