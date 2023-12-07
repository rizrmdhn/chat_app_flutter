import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/get_me_response.dart';
import 'package:equatable/equatable.dart';

class GetMeResponseModel extends Equatable {
  final MetaModel meta;
  final UserModel data;

  const GetMeResponseModel({
    required this.meta,
    required this.data,
  });

  factory GetMeResponseModel.fromJson(Map<String, dynamic> json) =>
      GetMeResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: UserModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  GetMeResponse toEntity() => GetMeResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}
