import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/condition/bloc/condition_bloc.dart';

class ConditionController {
  final BuildContext context;
  const ConditionController({required this.context});

  void hadleCondition() {
    final state = BlocProvider.of<ConditionBloc>(context).state;
    bool isAgree = state.isAgree;

    if (isAgree == false) {
      EasyLoading.showInfo("please agree to the terms and conditions");
    } else {
      Navigator.pushNamed(context, AppRoutes.OTP);
    }
  }
}
