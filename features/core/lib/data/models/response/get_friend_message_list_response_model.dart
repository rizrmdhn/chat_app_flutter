import 'package:core/data/models/message_friend_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/get_friend_message_list_response.dart';
import 'package:equatable/equatable.dart';

class GetFriendMessageListResponseModel extends Equatable {
  final MetaModel meta;
  final List<MessageFriendModel> data;

  const GetFriendMessageListResponseModel({
    required this.meta,
    required this.data,
  });

  factory GetFriendMessageListResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetFriendMessageListResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: List<MessageFriendModel>.from(
            json['data'].map((x) => MessageFriendModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };

  GetFriendMessageListResponse toEntity() => GetFriendMessageListResponse(
        meta: meta.toEntity(),
        data: data.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [meta, data];
}
