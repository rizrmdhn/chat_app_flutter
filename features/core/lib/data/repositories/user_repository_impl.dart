import 'dart:io';

import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:core/data/datasources/user_remote_data_source.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, User>> getMe(String accessToken) async {
    try {
      final result = await remoteDataSource.getMe(accessToken);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserName(
    String accessToken,
    String name,
  ) async {
    try {
      final result = await remoteDataSource.updateUserName(accessToken, name);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserAboutMe(
    String accessToken,
    String aboutMe,
  ) async {
    try {
      final result = await remoteDataSource.updateUserAboutMe(
        accessToken,
        aboutMe,
      );
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserStatus(
    String accessToken,
    String status,
  ) async {
    try {
      final result = await remoteDataSource.updateUserStatus(
        accessToken,
        status,
      );
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserProfilePicture(
    String accessToken,
    List<int> imageBytes,
    String fileName,
  ) async {
    try {
      final result = await remoteDataSource.updateUserProfilePicture(
        accessToken,
        imageBytes,
        fileName,
      );
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Connection Failure'));
    } catch (e) {
      return const Left(ServerFailure('Unknown Failure'));
    }
  }
}
