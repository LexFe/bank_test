import 'package:flutter/material.dart';
import 'package:login/screen/condition/widgets/widget.condition.dart';
import 'package:login/theme/app_color.dart';

class ConditionPage extends StatelessWidget {
  const ConditionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackGround,
      body: buildBodyCondition(context),
    );
  }
}
