import 'package:core/data/models/message_friend_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/restore_deleted_message_response.dart';
import 'package:equatable/equatable.dart';

class RestoreDeletedMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageFriendModel data;

  const RestoreDeletedMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory RestoreDeletedMessageResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RestoreDeletedMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageFriendModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  RestoreDeletedMessageResponse toEntity() => RestoreDeletedMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
