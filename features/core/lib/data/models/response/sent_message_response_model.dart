import 'package:core/data/models/message_friend_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/sent_message_response.dart';
import 'package:equatable/equatable.dart';

class SendMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageFriendModel data;

  const SendMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory SendMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      SendMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageFriendModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  SendMessageResponse toEntity() => SendMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
