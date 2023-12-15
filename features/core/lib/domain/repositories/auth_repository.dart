import 'package:core/common/failure.dart';
import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register({
    required String name,
    required String username,
    required String email,
    required String password,
  });
  Future<Either<Failure, AccessToken>> login({
    required String username,
    required String password,
  });
  Future<Either<Failure, String>> logout(
    String accessToken,
  );
  Future<Either<Failure, String>> saveAccessToken({
    required AccessToken accessToken,
  });
  Future<Either<Failure, String>> getAccessToken();
}
