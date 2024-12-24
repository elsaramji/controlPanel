// core/injection/get_it.dart
import 'dart:developer';

import 'package:furits_control/service/firebase/auth.dart';
import 'package:get_it/get_it.dart';



final getIt = GetIt.instance;

void setupGetIt() {
  try {
    getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  } catch (e) {
    log(e.toString());
  }
}
