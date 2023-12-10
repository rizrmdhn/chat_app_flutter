import 'dart:convert';
import 'package:core/data/models/access_token_model.dart';
import 'package:core/data/models/response/login_response_model.dart';
import 'package:core/data/models/response/register_response_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AccessTokenModel> login({
    required String email,
    required String password,
  });
  Future<RegisterDataModel> register({
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
    required String email,
    required String password,
  }) async {
    var map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    final response = await client.post(
      Uri.parse('$_baseUrl/login'),
      body: map,
    );

    if (response.statusCode == 200) {
      final accessToken =
          LoginResponseModel.fromJson(json.decode(response.body));

      return accessToken.data;
    } else {
      throw Exception('Failed to login');
    }
  }

  @override
  Future<RegisterDataModel> register({
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

    if (response.statusCode == 200) {
      final registerResponse =
          RegisterResponseModel.fromJson(json.decode(response.body));
      return registerResponse.data;
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
