import 'package:core/domain/entities/meta.dart';
import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class GetMeResponse extends Equatable {
  final Meta meta;
  final User data;

  const GetMeResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}
