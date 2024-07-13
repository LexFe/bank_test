import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screen/OTP/bloc/otp_bloc.dart';
import 'package:login/screen/condition/bloc/condition_bloc.dart';
import 'package:login/screen/crud/bloc/crud_bloc.dart';
import 'package:login/screen/home/bloc/home_bloc.dart';
import 'package:login/screen/login/bloc/login_bloc.dart';
import 'package:login/screen/main_home/bloc/main_bloc.dart';

class AppBlocProvider {
  static get allBlocProvider => [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => MainBloc(),
        ),
        BlocProvider(
          create: (context) => ConditionBloc(),
        ),
        BlocProvider(
          create: (context) => OtpBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => CrudBloc(),
        ),
      ];
}
