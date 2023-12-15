import 'package:core/common/failure.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserLogout {
  final AuthRepository repository;

  UserLogout(this.repository);

  Future<Either<Failure, String>> execute(String accessToken) async {
    return await repository.logout(accessToken);
  }
}
