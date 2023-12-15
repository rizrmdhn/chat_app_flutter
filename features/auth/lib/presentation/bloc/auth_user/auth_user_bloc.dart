import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/get_access_token.dart';
import 'package:core/domain/usecases/get_me.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  final GetAccessToken getAccessToken;
  final GetMe getMe;

  AuthUserBloc(
    this.getAccessToken,
    this.getMe,
  ) : super(AuthUserInitial()) {
    on<LoadAuthUser>((event, emit) => getAuthUser(event, emit));
  }

  Future<void> getAuthUser(
    LoadAuthUser event,
    Emitter<AuthUserState> emit,
  ) async {
    final resultToken = await getAccessToken.execute();
    await resultToken.fold(
      (failure) async {
        emit(AuthUserError(failure.message));
      },
      (data) async {
        emit(AuthUserLoading());

        final result = await getMe.execute(data);

        result.fold(
          (failure) => emit(AuthUserError(failure.message)),
          (data) async {
            emit(AuthUserLoaded(data));
          },
        );
      },
    );
  }
}
