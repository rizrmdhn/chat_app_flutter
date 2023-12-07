import 'package:core/data/models/group_list_model.dart';
import 'package:core/data/models/meta_model.dart';
import 'package:core/domain/entities/response/get_group_list_response.dart';
import 'package:equatable/equatable.dart';

class GetGroupListResponseModel extends Equatable {
  final MetaModel meta;
  final List<GroupListModel> data;

  const GetGroupListResponseModel({
    required this.meta,
    required this.data,
  });

  factory GetGroupListResponseModel.fromJson(Map<String, dynamic> json) =>
      GetGroupListResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: List<GroupListModel>.from(
            json['data'].map((x) => GroupListModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };

  GetGroupListResponse toEntity() => GetGroupListResponse(
        meta: meta.toEntity(),
        data: data.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [meta, data];
}
