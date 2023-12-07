import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/logout_response.dart';
import 'package:equatable/equatable.dart';

class LogoutResponseModel extends Equatable {
  final MetaModel meta;

  const LogoutResponseModel({
    required this.meta,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      LogoutResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  LogoutResponse toEntity() => LogoutResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
