// core/helper/on_generate.dart

import 'package:flutter/material.dart';
import 'package:furits_control/components/addItemsform/view/adding_form.dart';
import 'package:furits_control/components/auth/forgetpassword/view/forget_password_viwe.dart';
import 'package:furits_control/components/controls/views/controls_view.dart';
import 'package:furits_control/components/delivery_management/views/delivery_view.dart';
import 'package:furits_control/components/products_management/views/products_view.dart';
import 'package:furits_control/components/support_service/views/service_view.dart';

import '../../components/auth/signin/view/view.dart';

Route<dynamic> ongenerate(RouteSettings setting) {
  switch (setting.name) {
    case SigninAsAdmin.route:
      return MaterialPageRoute(builder: (context) => SigninAsAdmin());
    case ForgetPasswordViwe.routeName:
      return MaterialPageRoute(builder: (context) => ForgetPasswordViwe());
    case ControlsView.routeName:
      return MaterialPageRoute(builder: (context) => const ControlsView());
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductsView());
    case DeliveryView.routeName:
      return MaterialPageRoute(builder: (context) => const DeliveryView());
    case ServiceView.routeName:
      return MaterialPageRoute(builder: (context) => const ServiceView());
    case AddingForm.routeName:
      return MaterialPageRoute(builder: (context) => AddingForm());
    default:
      return MaterialPageRoute(builder: (context) => SigninAsAdmin());
  }
}
