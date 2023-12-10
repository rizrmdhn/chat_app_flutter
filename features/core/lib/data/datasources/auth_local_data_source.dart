import 'package:core/common/exception.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/models/access_token_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(AccessTokenModel accessToken);
  Future<String> getAccessToken();
  Future<void> deleteAccessToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final DatabaseHelper databaseHelper;

  AuthLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<void> saveAccessToken(AccessTokenModel accessToken) async {
    try {
      await databaseHelper.insertAccessToken(accessToken);
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> getAccessToken() async {
    try {
      final accessToken = await databaseHelper.getAccessToken();
      if (accessToken != null) {
        return accessToken.token;
      } else {
        throw TokenException('Token not found');
      }
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<void> deleteAccessToken() async {
    try {
      await databaseHelper.deleteAccessToken();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
