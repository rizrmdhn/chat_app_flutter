import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class BadRequestResponse extends Equatable {
  final Meta meta;
  final BadRequestData data;

  const BadRequestResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class BadRequestData extends Equatable {
  final List<BadRequestError> errors;

  const BadRequestData({
    required this.errors,
  });

  @override
  List<Object?> get props => [errors];
}

class BadRequestError extends Equatable {
  final String rule;
  final String field;
  final String message;

  const BadRequestError({
    required this.rule,
    required this.field,
    required this.message,
  });

  @override
  List<Object?> get props => [rule, field, message];
}
