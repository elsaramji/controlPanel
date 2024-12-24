// core/helper/on_generate.dart

import 'package:flutter/material.dart';
import 'package:furits_control/components/controls/views/controls_view.dart';

import '../../components/auth/signin/view/view.dart';

Route<dynamic> ongenerate(RouteSettings setting) {
  switch (setting.name) {
    case SigninAsAdmin.route:
      return MaterialPageRoute(builder: (context) => SigninAsAdmin());
    case ControlsView.route:
      return MaterialPageRoute(builder: (context) => const ControlsView());
    default:
      return MaterialPageRoute(builder: (context) => SigninAsAdmin());
  }
}