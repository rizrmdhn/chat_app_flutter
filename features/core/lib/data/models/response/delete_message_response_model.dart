import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/delete_message_response.dart';
import 'package:equatable/equatable.dart';

class DeleteMessageResponseModel extends Equatable {
  final MetaModel meta;

  const DeleteMessageResponseModel({
    required this.meta,
  });

  factory DeleteMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  DeleteMessageResponse toEntity() => DeleteMessageResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
