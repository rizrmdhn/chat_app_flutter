import 'package:core/domain/entities/meta.dart';
import 'package:core/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class GetFriendsResponse extends Equatable {
  final Meta meta;
  final GetFriendsData data;

  const GetFriendsResponse({
    required this.meta,
    required this.data,
  });

  @override
  List<Object?> get props => [meta, data];
}

class GetFriendsData extends Equatable {
  final List<User> friends;
  final List<User> friendRequests;
  final List<User> sentRequests;

  const GetFriendsData({
    required this.friends,
    required this.friendRequests,
    required this.sentRequests,
  });

  @override
  List<Object?> get props => [friends, friendRequests, sentRequests];
}
