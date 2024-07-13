import 'package:flutter/material.dart';
import 'package:login/screen/register/widgets/widget.register.dart';
import 'package:login/theme/app_color.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text('Register'),
      ),
      backgroundColor: AppColor.blackGround,
      body: buildBodyRegister(context),
    );
  }
}
