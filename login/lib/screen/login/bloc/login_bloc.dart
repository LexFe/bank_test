import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/common/enum/enum.status.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginUsernameChangingEvent>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<LoginPasswordChangingEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
