import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/delete_friend_response.dart';
import 'package:equatable/equatable.dart';

class DeleteFriendResponseModel extends Equatable {
  final MetaModel meta;

  const DeleteFriendResponseModel({
    required this.meta,
  });

  factory DeleteFriendResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteFriendResponseModel(
        meta: MetaModel.fromJson(json['meta']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
      };

  DeleteFriendResponse toEntity() => DeleteFriendResponse(
        meta: meta.toEntity(),
      );

  @override
  List<Object?> get props => [meta];
}
