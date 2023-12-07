import 'package:core/data/models/message_group_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/send_group_message_response.dart';
import 'package:equatable/equatable.dart';

class SendGroupMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageGroupModel data;

  const SendGroupMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory SendGroupMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      SendGroupMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageGroupModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  SendGroupMessageResponse toEntity() => SendGroupMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
