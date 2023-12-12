import 'package:core/common/failure.dart';
import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogin {
  final AuthRepository repository;

  UserLogin(this.repository);

  Future<Either<Failure, AccessToken>> execute({
    required String username,
    required String password,
  }) async {
    return await repository.login(
      username: username,
      password: password,
    );
  }
}
