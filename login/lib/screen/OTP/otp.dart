import 'package:flutter/material.dart';
import 'package:login/screen/OTP/widgets/widget.OTP.dart';
import 'package:login/theme/app_color.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackGround,
      body: buildBodyOTP(context),
    );
  }
}
