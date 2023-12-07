import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/cancel_friend_request_response.dart';
import 'package:equatable/equatable.dart';

class CancelFriendRequestResponseModel extends Equatable {
  final MetaModel meta;

  const CancelFriendRequestResponseModel({
    required this.meta,
  });

  factory CancelFriendRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CancelFriendRequestResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  CancelFriendRequestResponse toEntity() => CancelFriendRequestResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
