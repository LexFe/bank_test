part of 'crud_bloc.dart';

sealed class CrudEvent extends Equatable {
  const CrudEvent();

  @override
  List<Object> get props => [];
}


class FetchUser extends CrudEvent {

  final List<UserModel> userModel;

  const FetchUser({this.userModel = const <UserModel>[]});  

  @override
  List<Object> get props => [userModel];
}