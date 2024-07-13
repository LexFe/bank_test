import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/theme/app_color.dart';

void showLoadingIndicator() {
  EasyLoading.show(
    indicator: const CircularProgressIndicator(
      color: AppColor.primaryColor,
    ),
    maskType: EasyLoadingMaskType.clear,
    dismissOnTap: true,
  );
}
