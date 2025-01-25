// components/auth/signin/logic/functions.dart
import 'package:flutter/material.dart';
import 'package:furits_control/service/blocks/cubits/sginin_cubit/siginin_cubit_cubit.dart';

import '../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../service/firebase/auth.dart';
import '../../../controls/views/controls_view.dart';

class LogicFunctionSignin {
  static void statelistener(
      SigninState state, BuildContext context, FirebaseAuthService auth) {
        
    if (state is SigninSuccess) {
      if (auth.isLoggedIn()) {
        Navigator.restorablePopAndPushNamed(context, ControlsView.routeName);
      }
      ErrorsMassage.errorsBar(context, 'تم تسجيل الدخول بنجاح');
    }
    if (state is SigninError) {
      ErrorsMassage.errorsBar(context, state.error);
    }
  }
}
