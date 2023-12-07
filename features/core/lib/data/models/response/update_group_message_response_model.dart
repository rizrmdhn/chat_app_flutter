import 'package:core/data/models/message_group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/update_group_message_response.dart';
import 'package:equatable/equatable.dart';

class UpdateGroupMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageGroupModel data;

  const UpdateGroupMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateGroupMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateGroupMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageGroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateGroupMessageResponse toEntity() => UpdateGroupMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
