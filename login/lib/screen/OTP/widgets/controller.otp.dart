import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/register/bloc/register_bloc.dart';

class OTPController {
  final BuildContext context;
  const OTPController({required this.context});

  Future<void> hadleOTP() async {
    try {
      final state = BlocProvider.of<RegisterBloc>(context).state;
      String username = state.username;
      String password = state.password;

      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      final createUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );

      if (createUser.user != null) {
        await createUser.user!.sendEmailVerification();
        await createUser.user!.updateDisplayName(state.name);

        EasyLoading.showInfo(
            "A verification email has been sent to your email address");

        EasyLoading.dismiss();

        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.LOGIN, (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        EasyLoading.showError("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        EasyLoading.showError("The account already exists for that email.");
      } else if (e.code == 'invalid-email') {
        EasyLoading.showError("The email address is badly formatted.");
      }
    } catch (e) {
      EasyLoading.showError("Login failed");
    }
  }
}
