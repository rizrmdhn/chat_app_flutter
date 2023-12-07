import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class DeleteFriendResponse extends Equatable {
  final Meta meta;

  const DeleteFriendResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
