part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final String username;
  final String password;
  final StatusLoading status;

  const LoginState({
    this.username = '',
    this.password = '',
    this.status = StatusLoading.init,
  });

  LoginState copyWith({
    String? username,
    String? password,
    StatusLoading? status,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [username, password, status];
}
