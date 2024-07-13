import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterPositionChanged>((event, emit) {
      emit(state.copyWith(position: event.position));
    });

    on<RegisterNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
    });

    on<RegisterSurnameChanged>((event, emit) {
      emit(state.copyWith(surname: event.surname));
    });

    on<RegisterProvinceChanged>((event, emit) {
      emit(state.copyWith(province: event.province));
    });

    on<RegisterUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<RegisterPhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone));
    });

    on<RegisterPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RegisterPasswordConfirmChanged>((event, emit) {
      emit(state.copyWith(passwordConfirm: event.passwordConfirm));
    });
  }
}
