import 'package:core/common/failure.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserRegister {
  final AuthRepository repository;

  UserRegister(this.repository);

  Future<Either<Failure, User>> execute({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    return await repository.register(
      name: name,
      username: username,
      email: email,
      password: password,
    );
  }
}
