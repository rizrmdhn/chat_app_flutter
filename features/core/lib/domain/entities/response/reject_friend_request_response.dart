import 'package:core/domain/entities/meta.dart';
import 'package:equatable/equatable.dart';

class RejectFriendRequestResponse extends Equatable {
  final Meta meta;

  const RejectFriendRequestResponse({
    required this.meta,
  });

  @override
  List<Object?> get props => [meta];
}
