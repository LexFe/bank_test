import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/routes/global_observer.dart';
import 'common/service/storage_sebice.dart';

class Global {
  static late Service userService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    userService = await Service().init();
  }
}
