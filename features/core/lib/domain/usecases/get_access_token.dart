import 'package:core/common/failure.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetAccessToken {
  final AuthRepository repository;

  GetAccessToken(this.repository);

  Future<Either<Failure, String>> execute() async {
    return await repository.getAccessToken();
  }
}
