import 'package:auth/presentation/bloc/auth_user/auth_user_bloc.dart';
import 'package:auth/presentation/bloc/login/login_bloc.dart';
import 'package:auth/presentation/bloc/logout/logout_bloc.dart';
import 'package:auth/presentation/bloc/register/register_bloc.dart';
import 'package:core/data/datasources/auth_local_data_source.dart';
import 'package:core/data/datasources/auth_remote_data_source.dart';
import 'package:core/data/datasources/db/database_helper.dart';
import 'package:core/data/datasources/user_remote_data_source.dart';
import 'package:core/data/repositories/auth_repository_impl.dart';
import 'package:core/data/repositories/user_repository_impl.dart';
import 'package:core/domain/repositories/auth_repository.dart';
import 'package:core/domain/repositories/user_repository.dart';
import 'package:core/domain/usecases/get_access_token.dart';
import 'package:core/domain/usecases/get_me.dart';
import 'package:core/domain/usecases/save_access_token.dart';
import 'package:core/domain/usecases/user_login.dart';
import 'package:core/domain/usecases/user_logout.dart';
import 'package:core/domain/usecases/user_register.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // Bloc
  locator.registerFactory(
    () => AuthUserBloc(
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => LoginBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => LogoutBloc(
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory(
    () => RegisterBloc(
      locator(),
    ),
  );

  // Use cases
  locator.registerLazySingleton(
    () => GetMe(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => UserLogin(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => UserLogout(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => UserRegister(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => SaveAccessToken(
      locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetAccessToken(
      locator(),
    ),
  );

  // Repository
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );
  locator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // Helpers
  locator.registerLazySingleton(
    () => DatabaseHelper(),
  );

  // External
  locator.registerLazySingleton(
    () => http.Client(),
  );
}
