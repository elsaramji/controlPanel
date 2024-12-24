// components/auth/signin/view/view.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/controls/views/controls_view.dart';

import '../../../../core/constant/ui_items.dart';
import '../../../../core/custom/widget/custom_Appbar.dart';
import '../../../../core/custom/widget/custom_errors_massage.dart';
import '../../../../core/custom/widget/custom_text_filed.dart';
import '../../../../core/injection/get_it.dart';
import '../../../../service/firebase/auth.dart';
import '../../../../service/sginin_cubit/siginin_cubit_cubit.dart';
import '../widget/admin_rules.dart';
import '../widget/forgetpassword.dart';
import '../widget/sigin_button.dart';

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
              Navigator.pushReplacementNamed(context, ControlsView.route);

              ErrorsMassage.errorsBar(context, 'تم تسجيل الدخول بنجاح');
            }
            if (state is SigninError) {
              ErrorsMassage.errorsBar(context, state.error);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: customAppBar(
                  context: context,
                  title: 'تسجيل الدخول كمسؤول',
                  iconleading: const Icon(Icons.arrow_back_ios)),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 32,
                          ),
                          CustomTextformField(
                            keybordetepy: TextInputType.emailAddress,
                            hinttext: 'البريد الالكتروني',
                            onsaved: (value) => email = value!,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextformField(
                            keybordetepy: TextInputType.visiblePassword,
                            hinttext: 'كلمة المرور',
                            obscuretext: true,
                            suffixicons: Items.visiibleIcons,
                            onsaved: (value) => password = value!,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const NavigateForgetpassword(),
                          const SizedBox(
                            height: 16,
                          ),
                          SignInButton(onPressed: () async {
                            formkey.currentState!.save();
                            await BlocProvider.of<SigninCubit>(context)
                                .signInWithemailandpassword(
                                    email: email, password: password);
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const AdminsRules(),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
