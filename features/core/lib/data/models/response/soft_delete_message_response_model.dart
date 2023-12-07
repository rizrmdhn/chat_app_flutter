import 'package:core/data/models/message_friend_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/soft_delete_message_response.dart';
import 'package:equatable/equatable.dart';

class SoftDeleteMessageResponseModel extends Equatable {
  final MetaModel meta;
  final MessageFriendModel data;

  const SoftDeleteMessageResponseModel({
    required this.meta,
    required this.data,
  });

  factory SoftDeleteMessageResponseModel.fromJson(Map<String, dynamic> json) =>
      SoftDeleteMessageResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: MessageFriendModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  SoftDeleteMessageResponse toEntity() => SoftDeleteMessageResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
