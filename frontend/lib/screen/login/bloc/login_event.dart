part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChangingEvent extends LoginEvent {
  const LoginUsernameChangingEvent(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPasswordChangingEvent extends LoginEvent {
  const LoginPasswordChangingEvent(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}
