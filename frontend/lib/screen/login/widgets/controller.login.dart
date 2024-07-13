import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/common/utils/http_utils.dart';
import 'package:login/common/values/constant.dart';
import 'package:login/global.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/crud/widgets/controller.crud.dart';
import 'package:login/screen/login/bloc/login_bloc.dart';

class LoginController {
  final BuildContext context;
  const LoginController({required this.context});

  Future<void> hadleLogin() async {
    try {
      final state = BlocProvider.of<LoginBloc>(context).state;
      String username = state.username;
      String password = state.password;

      if (username.isEmpty) {
        EasyLoading.showInfo("please enter username");
        return;
      } else if (password.isEmpty) {
        EasyLoading.showInfo("please enter password");
        return;
      } else if (password.length < 8) {
        EasyLoading.showInfo("password must be at least 8 characters long");
        return;
      } else {
        EasyLoading.show(
          status: 'loading...',
          maskType: EasyLoadingMaskType.black,
        );

        final res = await HttpUtil().post("auth/login", data: {
          "email": username,
          "password": password,
        });

        if (res.data["statusCode"] == 200) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, AppRoutes.MAINHOME);
        } else {
          EasyLoading.dismiss();
          EasyLoading.showError("Login failed");
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
