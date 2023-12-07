import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/reject_friend_request_response.dart';
import 'package:equatable/equatable.dart';

class RejectFriendRequestResponseModel extends Equatable {
  final MetaModel meta;

  const RejectFriendRequestResponseModel({
    required this.meta,
  });

  factory RejectFriendRequestResponseModel.fromJson(
          Map<String, dynamic> json) =>
      RejectFriendRequestResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  RejectFriendRequestResponse toEntity() => RejectFriendRequestResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
