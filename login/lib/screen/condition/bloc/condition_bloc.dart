import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'condition_event.dart';
part 'condition_state.dart';

class ConditionBloc extends Bloc<ConditionEvent, ConditionState> {
  ConditionBloc() : super(const ConditionState()) {
    on<ConditionAgreeChanged>((event, emit) {
      emit(state.copyWith(isAgree: event.isAgree));
    });
  }
}
