import 'package:flutter/material.dart';
import 'package:login/screen/login/widgets/widget.login.dart';
import 'package:login/theme/app_color.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBodyLogin(context),
        backgroundColor: AppColor.primaryColor,
      ),
    );
  }
}
