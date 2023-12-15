import 'package:auth/presentation/bloc/auth_user/auth_user_bloc.dart';
import 'package:core/domain/usecases/get_access_token.dart';
import 'package:core/domain/usecases/user_logout.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final GetAccessToken getAccessToken;
  final UserLogout userLogout;
  final AuthUserBloc authUserBloc;

  LogoutBloc(
    this.getAccessToken,
    this.userLogout,
    this.authUserBloc,
  ) : super(LogoutInitial()) {
    on<Logout>((event, emit) => getLogout(event, emit));
  }

  Future<void> getLogout(Logout event, Emitter<LogoutState> emit) async {
    final resultToken = await getAccessToken.execute();

    await resultToken.fold(
      (failure) async {
        emit(LogoutError(failure.message));
      },
      (data) async {
        emit(LogoutLoading());
        userLogout.execute(data);
        emit(LogoutLoaded());
        authUserBloc.add(LoadAuthUser());
      },
    );
  }
}
