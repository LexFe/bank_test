part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterPositionChanged extends RegisterEvent {
  final int position;

  const RegisterPositionChanged({required this.position});

  @override
  List<Object> get props => [position];
}

class RegisterNameChanged extends RegisterEvent {
  final String name;

  const RegisterNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class RegisterSurnameChanged extends RegisterEvent {
  final String surname;

  const RegisterSurnameChanged({required this.surname});

  @override
  List<Object> get props => [surname];
}

class RegisterProvinceChanged extends RegisterEvent {
  final String province;

  const RegisterProvinceChanged({required this.province});

  @override
  List<Object> get props => [province];
}

class RegisterUsernameChanged extends RegisterEvent {
  final String username;

  const RegisterUsernameChanged({required this.username});

  @override
  List<Object> get props => [username];
}

class RegisterPhoneChanged extends RegisterEvent {
  final String phone;

  const RegisterPhoneChanged({required this.phone});

  @override
  List<Object> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  const RegisterPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class RegisterPasswordConfirmChanged extends RegisterEvent {
  final String passwordConfirm;

  const RegisterPasswordConfirmChanged({required this.passwordConfirm});

  @override
  List<Object> get props => [passwordConfirm];
}
