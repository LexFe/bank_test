import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:login/common/utils/http_utils.dart';
import 'package:login/model/userModel.dart';
import 'package:login/screen/crud/bloc/crud_bloc.dart';

class UserController {
  final BuildContext context;
  const UserController({required this.context});

  Future<void> hadleDetdata() async {
    try {
      EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );

      final res = await HttpUtil().get("users", queryParameters: {
        "skip": 0,
      });

      print(res.data.toString());

      if (res.data["statusCode"] == 200) {
        final List dynamicList = res.data as List;

        List<UserModel> categoryModelList =
            dynamicList.map((json) => UserModel.fromJson(json)).toList();
        if (context.mounted) {
          context.read<CrudBloc>().add(FetchUser(userModel: categoryModelList));
        }
        EasyLoading.dismiss();
      } else {
        debugPrint(res);
        EasyLoading.dismiss();
        EasyLoading.showError("Login failed");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print(e.toString());
      EasyLoading.showError(e.toString());
    }
  }
}
