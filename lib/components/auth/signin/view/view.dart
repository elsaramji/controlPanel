// components/auth/signin/view/view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/auth/signin/widget/signinform.dart';
import 'package:furits_control/components/controls/views/controls_view.dart';

import '../../../../core/custom/widget/custom_Appbar.dart';
import '../../../../core/custom/widget/custom_errors_massage.dart';
import '../../../../core/injection/get_it.dart';
import '../../../../service/firebase/auth.dart';
import '../../../../service/sginin_cubit/siginin_cubit_cubit.dart';
import '../widget/admin_rules.dart';

class SigninAsAdmin extends StatelessWidget {
  static const String route = '/signinasadmin';
  late String email, password;
  final formkey = GlobalKey<FormState>();

  final auth = getIt<FirebaseAuthService>();

  SigninAsAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(auth),
      child: Builder(builder: (context) {
        return BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninSuccess) {
              if (auth.isLoggedIn()) {
                Navigator.pushReplacementNamed(context, ControlsView.route);
              }
              ErrorsMassage.errorsBar(context, 'تم تسجيل الدخول بنجاح');
            }
            if (state is SigninError) {
              ErrorsMassage.errorsBar(context, state.error);
            }
          },
          builder: (context, state) {
            if (auth.isLoggedIn()) {
              return const ControlsView();
            } else {
              return Scaffold(
                appBar: customAppBar(
                  context: context,
                  title: 'تسجيل الدخول كمسؤول',
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      //form sheet signin
                      SigninForm(),
                      //spacer
                      const SizedBox(
                        height: 16,
                      ),
                      // user Attention
                      const AdminsRules(),
                    ],
                  ),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
