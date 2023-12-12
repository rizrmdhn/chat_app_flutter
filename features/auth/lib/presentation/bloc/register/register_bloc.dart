import 'package:core/domain/entities/user.dart';
import 'package:core/domain/usecases/user_register.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegister register;

  RegisterBloc(
    this.register,
  ) : super(RegisterInitial()) {
    on<Register>((event, emit) => getRegister(event, emit));
  }

  Future<void> getRegister(Register event, Emitter<RegisterState> emit) async {
    final name = event.name;
    final username = event.username;
    final email = event.email;
    final password = event.password;

    emit(RegisterLoading());

    final result = await register.execute(
      name: name,
      username: username,
      email: email,
      password: password,
    );

    await result.fold(
      (failure) async {
        emit(RegisterError(failure.message));
      },
      (data) async {
        emit(RegisterSuccess(data));
      },
    );
  }
}
