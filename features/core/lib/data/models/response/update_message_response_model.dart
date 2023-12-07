import 'package:core/data/models/message_friend_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/update_message_response.dart';
import 'package:equatable/equatable.dart';

class UpdateMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageFriendModel data;

  const UpdateMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory UpdateMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      UpdateMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageFriendModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  UpdateMessageResponse toEntity() => UpdateMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
