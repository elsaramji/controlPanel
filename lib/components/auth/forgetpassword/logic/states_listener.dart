// components/auth/forgetpassword/logic/states_listener.dart
import 'package:flutter/material.dart';
import 'package:furits_control/components/auth/forgetpassword/logic/open_other_apps.dart';

import '../../../../core/custom/show_errors/custom_errors_massage.dart';
import '../../../../service/forgetpassword/forgetpassword_cubit.dart';

class StatesListener {
  static void stateslistener(
      {required BuildContext context, required ForgetpasswordState states}) {
    if (states is ForgetpasswordSuccess) {
      ErrorsMassage.errorsBar(
          context, "تم ارسال رمز التحقق الى بريدك الالكتروني");
      Future.delayed(const Duration(microseconds: 30), () {
        OpenOtherApps.openAppByPackageName("com.google.android.gm");
      });
    } else if (states is ForgetpasswordError) {
      ErrorsMassage.errorsBar(context, states.message);
    }
  }
}
