import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class DeleteGroupMessageResponse extends Equatable {
  final Meta meta;

  const DeleteGroupMessageResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
