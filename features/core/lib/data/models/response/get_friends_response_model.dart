import 'package:core/data/models/meta_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:core/domain/entities/response/get_friends_response.dart';
import 'package:equatable/equatable.dart';

class GetFriendsResponseModel extends Equatable {
  final MetaModel meta;
  final GetFriendsDataModel data;

  const GetFriendsResponseModel({
    required this.meta,
    required this.data,
  });

  factory GetFriendsResponseModel.fromJson(Map<String, dynamic> json) =>
      GetFriendsResponseModel(
        meta: MetaModel.fromJson(json['meta']),
        data: GetFriendsDataModel.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'meta': meta.toJson(),
        'data': data.toJson(),
      };

  GetFriendsResponse toEntity() => GetFriendsResponse(
        meta: meta.toEntity(),
        data: data.toEntity(),
      );

  @override
  List<Object?> get props => [meta, data];
}

class GetFriendsDataModel extends Equatable {
  final List<UserModel> friends;
  final List<UserModel> friendRequests;
  final List<UserModel> sentRequests;

  const GetFriendsDataModel({
    required this.friends,
    required this.friendRequests,
    required this.sentRequests,
  });

  factory GetFriendsDataModel.fromJson(Map<String, dynamic> json) =>
      GetFriendsDataModel(
        friends: List<UserModel>.from(
            json['friends'].map((x) => UserModel.fromJson(x))),
        friendRequests: List<UserModel>.from(
            json['friend_requests'].map((x) => UserModel.fromJson(x))),
        sentRequests: List<UserModel>.from(
            json['sent_requests'].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'friends': List<dynamic>.from(friends.map((x) => x.toJson())),
        'friend_requests':
            List<dynamic>.from(friendRequests.map((x) => x.toJson())),
        'sent_requests':
            List<dynamic>.from(sentRequests.map((x) => x.toJson())),
      };

  GetFriendsData toEntity() => GetFriendsData(
        friends: friends.map((x) => x.toEntity()).toList(),
        friendRequests: friendRequests.map((x) => x.toEntity()).toList(),
        sentRequests: sentRequests.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [friends, friendRequests, sentRequests];
}
