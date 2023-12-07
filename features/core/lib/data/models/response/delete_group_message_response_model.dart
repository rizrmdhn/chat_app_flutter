import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/delete_group_message_response.dart';
import 'package:equatable/equatable.dart';

class DeleteGroupMessageResponseModel extends Equatable {
  final MetaModel meta;

  const DeleteGroupMessageResponseModel({
    required this.meta,
  });

  factory DeleteGroupMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteGroupMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  DeleteGroupMessageResponse toEntity() => DeleteGroupMessageResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
