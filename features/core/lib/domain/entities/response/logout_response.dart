import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class LogoutResponse extends Equatable {
  final Meta meta;

  const LogoutResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
