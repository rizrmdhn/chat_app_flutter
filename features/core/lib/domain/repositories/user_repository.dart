import 'package:core/common/failure.dart';
import 'package:core/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getMe(String accessToken);
  Future<Either<Failure, User>> updateUserName(String accessToken, String name);
  Future<Either<Failure, User>> updateUserAboutMe(
      String accessToken, String aboutMe);
  Future<Either<Failure, User>> updateUserStatus(
      String accessToken, String status);
  Future<Either<Failure, User>> updateUserProfilePicture(
    String accessToken,
    List<int> imageBytes,
    String fileName,
  );
}
