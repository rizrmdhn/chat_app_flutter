import 'package:core/domain/entities/access_token.dart';
import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/get_me.dart';
import 'package:core/domain/usecases/save_access_token.dart';
import 'package:core/domain/usecases/user_login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLogin login;
  final SaveAccessToken saveAccessToken;
  final GetMe getMe;

  LoginBloc(
    this.login,
    this.saveAccessToken,
    this.getMe,
  ) : super(LoginInitial()) {
    on<Login>((event, emit) => getLogin(event, emit));
  }

  Future<void> getLogin(Login event, Emitter<LoginState> emit) async {
    final username = event.username;
    final password = event.password;

    emit(LoginLoading());

    final result = await login.execute(
      username: username,
      password: password,
    );

    await result.fold(
      (failure) async {
        emit(LoginError(failure.message));
      },
      (data) async {
        await saveAccessToken.execute(data);
        emit(LoginLoaded(data));
        final resultMe = await getMe.execute(data.token);
        resultMe.fold(
          (failure) => emit(LoginError(failure.message)),
          (data) => emit(LoginUserLoaded(data)),
        );
      },
    );
  }
}
