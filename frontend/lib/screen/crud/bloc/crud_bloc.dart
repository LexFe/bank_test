import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login/model/userModel.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc() : super(CrudState()) {
    on<CrudEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchUser> ((event, emit) {
      emit(state.copyWith(userModel: event.userModel));
    });
  }
}
