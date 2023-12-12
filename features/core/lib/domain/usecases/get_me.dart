import 'package:core/common/failure.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetMe {
  final UserRepository repository;

  GetMe(this.repository);

  Future<Either<Failure, User>> execute(String accessToken) async {
    return await repository.getMe(accessToken);
  }
}
