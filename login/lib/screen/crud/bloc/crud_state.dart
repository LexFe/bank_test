part of 'crud_bloc.dart';

class CrudState extends Equatable {
  final List<UserModel> userModel;

  const CrudState({this.userModel = const <UserModel>[]});

  CrudState copyWith({List<UserModel>? userModel}) {
    return CrudState(userModel: userModel ?? this.userModel);
  }

  @override
  List<Object> get props => [ userModel];
}


