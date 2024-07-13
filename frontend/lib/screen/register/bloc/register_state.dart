part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final int position;
  final String name;
  final String surname;
  final String province;
  final String username;
  final String phone;
  final String password;
  final String passwordConfirm;
  const RegisterState(
      {this.position = 1,
      this.name = '',
      this.surname = '',
      this.province = '',
      this.username = '',
      this.phone = '',
      this.password = '',
      this.passwordConfirm = ''});

  RegisterState copyWith({
    int? position,
    String? name,
    String? surname,
    String? province,
    String? username,
    String? phone,
    String? password,
    String? passwordConfirm,
  }) {
    return RegisterState(
        position: position ?? this.position,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        province: province ?? this.province,
        username: username ?? this.username,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm);
  }

  @override
  List<Object> get props => [
        position,
        name,
        surname,
        province,
        username,
        phone,
        password,
        passwordConfirm
      ];
}
