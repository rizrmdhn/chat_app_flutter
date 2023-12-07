import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class DeleteMessageResponse extends Equatable {
  final Meta meta;

  const DeleteMessageResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
