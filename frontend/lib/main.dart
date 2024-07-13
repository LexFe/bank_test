import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:login/global.dart';
import 'package:login/screen/app.dart';

Future<void> main() async {
  Global.init();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA4kzvgpNTsbnChOiNHWnc7_S-HVD5RYrk",
          authDomain: "login-882cb.firebaseapp.com",
          projectId: "login-882cb",
          storageBucket: "login-882cb.appspot.com",
          messagingSenderId: "882665920976",
          appId: "1:882665920976:web:1009acc5afd37cf96bc1d5",
          measurementId: "G-PE96C6L3TT"),
    );
  } else {
    await Firebase.initializeApp();
  }

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
