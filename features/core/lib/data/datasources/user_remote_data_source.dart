import 'dart:convert';
import 'package:core/data/models/response/get_me_response_model.dart';
import 'package:core/data/models/response/update_user_name_response_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getMe(String accessToken);
  Future<UserModel> updateUserName(String accessToken, String name);
  Future<UserModel> updateUserAboutMe(String accessToken, String aboutMe);
  Future<UserModel> updateUserStatus(String accessToken, String status);
  Future<UserModel> updateUserProfilePicture(
    String accessToken,
    List<int> imageBytes,
    String fileName,
  );
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final String? _baseUrl = dotenv.env['API_URL'];

  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getMe(String accessToken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await client.get(
      Uri.parse('$_baseUrl/users/me'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final getMeResponse = GetMeResponseModel.fromJson(
        json.decode(response.body),
      );

      return getMeResponse.data;
    } else {
      throw Exception('Failed to get user');
    }
  }

  @override
  Future<UserModel> updateUserName(String accessToken, String name) async {
    var map = <String, dynamic>{
      'name': name,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await client.post(
      Uri.parse('$_baseUrl/users/me/name'),
      body: map,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final getMeResponse = UpdateUserNameResponseModel.fromJson(
        json.decode(response.body),
      );

      return getMeResponse.data;
    } else {
      throw Exception('Failed to update user name');
    }
  }

  @override
  Future<UserModel> updateUserAboutMe(
      String accessToken, String aboutMe) async {
    Map<String, dynamic> body = {
      'aboutMe': aboutMe,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await client.post(
      Uri.parse('$_baseUrl/users/me/about-me'),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final getMeResponse = UpdateUserNameResponseModel.fromJson(
        json.decode(response.body),
      );

      return getMeResponse.data;
    } else {
      throw Exception('Failed to update user about me');
    }
  }

  @override
  Future<UserModel> updateUserStatus(String accessToken, String status) async {
    Map<String, dynamic> body = {
      'status': status,
    };

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await client.post(
      Uri.parse('$_baseUrl/users/me/status'),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final getMeResponse = UpdateUserNameResponseModel.fromJson(
        json.decode(response.body),
      );

      return getMeResponse.data;
    } else {
      throw Exception('Failed to update user status');
    }
  }

  @override
  Future<UserModel> updateUserProfilePicture(
    String accessToken,
    List<int> imageBytes,
    String fileName,
  ) async {
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse('$_baseUrl/users/me/avatar'),
    );

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final multipartFile = http.MultipartFile.fromBytes(
      'avatar',
      imageBytes,
      filename: fileName,
    );

    try {
      request.headers.addAll(headers);
      request.files.add(multipartFile);

      final response = await request.send();

      if (response.statusCode == 200) {
        final getMeResponse = UpdateUserNameResponseModel.fromJson(
          json.decode(await response.stream.bytesToString()),
        );

        return getMeResponse.data;
      } else {
        throw Exception('Failed to update user profile picture');
      }
    } catch (e) {
      throw Exception('Failed to update user profile picture');
    }
  }
}
