import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/common/utils/http_utils.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/register/bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> hadleRegister() async {
    final state = BlocProvider.of<RegisterBloc>(context).state;
    String name = state.name;
    String surname = state.surname;
    String username = state.username;
    int? phone = int.tryParse(state.phone);
    String password = state.password;
    String passwordConfirm = state.passwordConfirm;

    try {
      if (name.isEmpty) {
        EasyLoading.showInfo("please enter name");
      } else if (surname.isEmpty) {
        EasyLoading.showInfo("please enter surname");
      } else if (username.isEmpty) {
        EasyLoading.showInfo("please enter email");
      } else if (!username.contains('@') || !username.contains('.com')) {
        EasyLoading.showInfo("please enter a valid email address");
      } else if (phone == null) {
        EasyLoading.showInfo("please enter phone");
      } else if (phone is String) {
        EasyLoading.showInfo("please enter phone number");
      } else if (password.isEmpty) {
        EasyLoading.showInfo("please enter password");
      } else if (passwordConfirm.isEmpty) {
        EasyLoading.showInfo("please enter password confirm");
      } else if (password != passwordConfirm) {
        EasyLoading.showInfo("password and password confirm must be the same");
      } else if (password.length < 8) {
        EasyLoading.showInfo("password must be at least 8 characters long");
      } else {
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );

        final res = await HttpUtil().post("auth/register", data: {
          "email": username,
          "password": password,
          "name": name,
          "lastName": surname,
          "phone": phone
        });
        debugPrint(res.data.toString());

        if (res.data["statusCode"] == 201) {
          EasyLoading.dismiss();
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.LOGIN, (route) => false);
        } else {
          debugPrint(res.data.toString());
          EasyLoading.dismiss();
          EasyLoading.showError("Register failed");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.dismiss();
      EasyLoading.showError("Register failed");
    }
  }
}
