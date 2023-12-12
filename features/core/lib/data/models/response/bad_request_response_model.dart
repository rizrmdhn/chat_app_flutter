import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/bad_request_response.dart';
import 'package:equatable/equatable.dart';

class BadRequestResponseModel extends Equatable {
  final MetaModel meta;
  final BadRequestDataModel data;

  const BadRequestResponseModel({
    required this.meta,
    required this.data,
  });

  factory BadRequestResponseModel.fromJson(Map<String, dynamic> json) =>
      BadRequestResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: BadRequestDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  BadRequestResponse toEntity() => BadRequestResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class BadRequestDataModel extends Equatable {
  final List<BadRequestErrorModel> errors;

  const BadRequestDataModel({
    required this.errors,
  });

  factory BadRequestDataModel.fromJson(Map<String, dynamic> json) =>
      BadRequestDataModel(
        errors: List<BadRequestErrorModel>.from(
          json['errors'].map(
            (x) => BadRequestErrorModel.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        'errors': List<dynamic>.from(
          errors.map(
            (x) => x.toJson(),
          ),
        ),
      };

  BadRequestData toEntity() => BadRequestData(
        errors: errors.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [errors];
}

class BadRequestErrorModel extends Equatable {
  final String rule;
  final String field;
  final String message;

  const BadRequestErrorModel({
    required this.rule,
    required this.field,
    required this.message,
  });

  factory BadRequestErrorModel.fromEntity(BadRequestError entity) =>
      BadRequestErrorModel(
        rule: entity.rule,
        field: entity.field,
        message: entity.message,
      );

  factory BadRequestErrorModel.fromJson(Map<String, dynamic> json) =>
      BadRequestErrorModel(
        rule: json['rule'],
        field: json['field'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'rule': rule,
        'field': field,
        'message': message,
      };

  BadRequestError toEntity() => BadRequestError(
        rule: rule,
        field: field,
        message: message,
      );

  @override
  List<Object?> get props => [rule, field, message];
}
