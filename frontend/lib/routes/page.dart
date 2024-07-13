import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/global.dart';
import 'package:login/routes/name.dart';
import 'package:login/screen/OTP/bloc/otp_bloc.dart';
import 'package:login/screen/condition/bloc/condition_bloc.dart';
import 'package:login/screen/condition/condition.dart';
import 'package:login/screen/crud/bloc/crud_bloc.dart';
import 'package:login/screen/crud/crud.dart';
import 'package:login/screen/curd_detail/bloc/detail_bloc.dart';
import 'package:login/screen/curd_detail/crud_detail.dart';
import 'package:login/screen/home/bloc/home_bloc.dart';
import 'package:login/screen/home/home.dart';
import 'package:login/screen/login/bloc/login_bloc.dart';
import 'package:login/screen/login/login.dart';
import 'package:login/screen/main_home/bloc/main_bloc.dart';
import 'package:login/screen/main_home/main_home.dart';
import 'package:login/screen/otp/otp.dart';
import 'package:login/screen/register/bloc/register_bloc.dart';
import 'package:login/screen/register/register.dart';

class AppPage {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.LOGIN,
        page: const LoginPage(),
        bloc: BlocProvider(
          create: (_) => LoginBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const RegisterPage(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.CONDITION,
        page: const ConditionPage(),
        bloc: BlocProvider(
          create: (_) => ConditionBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.OTP,
        page: const OTPPage(),
        bloc: BlocProvider(
          create: (_) => OtpBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.MAINHOME,
        page: const MainHomePage(),
        bloc: BlocProvider(
          create: (_) => MainBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.HOME,
        page: const HomePage(),
        bloc: BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.CRUD,
        page: const CRUDPage(),
        bloc: BlocProvider(
          create: (_) => CrudBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.DETAIL,
        page: const CRUDDetailPage(),
        bloc: BlocProvider(
          create: (_) => DetailBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProvider = <dynamic>[];
    for (var bloc in routes()) {
      blocProvider.add(bloc.bloc);
    }
    return blocProvider;
  }

  //a method that cover entire screen as we click on the navigator object in the app
  // ignore: non_constant_identifier_names
  static MaterialPageRoute GenerateRoutsSettings(RouteSettings settings) {
    bool isLogin = Global.userService.getIsLoggedIn();
    if (settings.name != null) {
      debugPrint("setting   :  ${settings.name}");
      var result = routes().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        if (result.first.route == AppRoutes.LOGIN) {
          if (isLogin) {
            return MaterialPageRoute(
                builder: (_) => const HomePage(), settings: settings);
          }
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      } else {
        if (isLogin) {
          return MaterialPageRoute(
              builder: (_) => const HomePage(), settings: settings);
        } else {
          return MaterialPageRoute(
              builder: (_) => const LoginPage(), settings: settings);
        }
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({required this.route, required this.page, required this.bloc});
}
