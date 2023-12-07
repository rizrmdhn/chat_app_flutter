import 'package:core/data/models/message_group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/soft_delete_group_message_response.dart';
import 'package:equatable/equatable.dart';

class SoftDeleteGroupMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageGroupModel data;

  const SoftDeleteGroupMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory SoftDeleteGroupMessageResponseModel.fromJson(
          Map<String, dynamic> json) =>
      SoftDeleteGroupMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageGroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  SoftDeleteGroupMessageResponse toEntity() => SoftDeleteGroupMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
