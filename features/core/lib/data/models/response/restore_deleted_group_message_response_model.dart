import 'package:core/data/models/message_group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/restore_deleted_group_message_response.dart';
import 'package:equatable/equatable.dart';

class ResoreDeletedGroupMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageGroupModel data;

  const ResoreDeletedGroupMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory ResoreDeletedGroupMessageResponseModel.fromJson(
          Map<String, dynamic> json) =>
      ResoreDeletedGroupMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageGroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  ResoreDeletedGroupMessageResponse toEntity() =>
      ResoreDeletedGroupMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
