import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class MetaModel extends Equatable {
  final int status;
  final String message;

  const MetaModel({
    required this.status,
    required this.message,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
        status: json['status'] as int,
        message: json['message'] as String,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };

  Meta toEntity() => Meta(
        status: status,
        message: message,
      );

  @override
  List<Object?> get props => [status, message];
}
