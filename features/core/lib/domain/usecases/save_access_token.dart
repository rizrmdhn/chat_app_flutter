import 'package:core/common/failure.dart';
import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SaveAccessToken {
  final AuthRepository repository;

  SaveAccessToken(this.repository);

  Future<Either<Failure, String>> execute(AccessToken accessToken) async {
    return await repository.saveAccessToken(accessToken: accessToken);
  }
}
