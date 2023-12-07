import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final Meta meta;
  final AccessToken data;

  const LoginResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
