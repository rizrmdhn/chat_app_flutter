import 'dart:convert';
import 'package:core/common/exception.dart';
import 'package:core/data/models/access_token_model.dart';
import 'package:core/data/models/response/bad_request_response_model.dart';
import 'package:core/data/models/response/login_response_model.dart';
import 'package:core/data/models/response/register_response_model.dart';
import 'package:core/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AccessTokenModel> login({
    required String username,
    required String password,
  });
  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  });
  Future<String> logout(String accessToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final String? _baseUrl = dotenv.env['API_URL'];

  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<AccessTokenModel> login({
    required String username,
    required String password,
  }) async {
    var map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    final response = await client.post(
      Uri.parse('$_baseUrl/login'),
      body: map,
    );

    if (response.statusCode == 200) {
      final accessToken = LoginResponseModel.fromJson(
        json.decode(response.body),
      );

      return accessToken.data;
    } else if (response.statusCode == 404) {
      throw NotFoundException('User not found');
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    final response = await client.post(
      Uri.parse('$_baseUrl/register'),
      body: map,
    );

    if (response.statusCode == 201) {
      final registerResponse = RegisterResponseModel.fromJson(
        json.decode(response.body),
      );

      return registerResponse.data;
    } else if (response.statusCode == 400) {
      final badRequestResponse = BadRequestResponseModel.fromJson(
        json.decode(response.body),
      );
      final listOfErrors = badRequestResponse.toEntity().data.errors;
      throw BadRequestException(
        listOfErrors.map((e) => e.message).toList().join(', '),
      );
    } else {
      throw Exception('Failed to register');
    }
  }

  @override
  Future<String> logout(String accessToken) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    final response = await client.post(
      Uri.parse('$_baseUrl/logout'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return Future.value('Logout success');
    } else {
      throw Exception('Failed to logout');
    }
  }
}
