import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class CancelFriendRequestResponse extends Equatable {
  final Meta meta;

  const CancelFriendRequestResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
