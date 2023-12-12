import 'dart:io';

import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:core/data/datasources/auth_local_data_source.dart';
import 'package:core/data/datasources/auth_remote_data_source.dart';
import 'package:core/data/models/access_token_model.dart';
import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.register(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, AccessToken>> login({
    required String username,
    required String password,
  }) async {
    try {
      final result = await remoteDataSource.login(
        username: username,
        password: password,
      );
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, String>> saveAccessToken({
    required AccessToken accessToken,
  }) async {
    try {
      final result = await localDataSource.saveAccessToken(
        AccessTokenModel.fromEntity(accessToken),
      );

      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, String>> getAccessToken() async {
    try {
      final result = await localDataSource.getAccessToken();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }
}
