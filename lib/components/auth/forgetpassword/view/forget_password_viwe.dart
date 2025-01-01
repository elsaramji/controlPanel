// components/auth/forgetpassword/view/forget_password_viwe.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furits_control/components/auth/forgetpassword/logic/open_other_apps.dart';
import 'package:furits_control/components/auth/forgetpassword/logic/states_listener.dart';

import '../../../../core/custom/widget/custom_Appbar.dart';
import '../../../../core/custom/widget/custom_button.dart';
import '../../../../core/custom/widget/custom_text_filed.dart';
import '../../../../core/injection/get_it.dart';
import '../../../../core/styles/color_style.dart';
import '../../../../core/styles/font_style.dart';
import '../../../../service/firebase/auth.dart';
import '../../../../service/forgetpassword/forgetpassword_cubit.dart';

class ForgetPasswordViwe extends StatelessWidget {
  static const routeName = '/forgetpassword';
  late String email;
  final auth = getIt<FirebaseAuthService>();
  final formKey = GlobalKey<FormState>();
  ForgetPasswordViwe({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context,
          title: 'اعادة تعيين كلمة المرور',
          iconleading: const Icon(Icons.arrow_back_ios)),
      body: BlocProvider(
        create: (context) => ForgetpasswordCubit(auth: auth),
        child: Builder(builder: (context) {
          return BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
            listener: (context, state) {
              StatesListener.stateslistener(
                context: context,
                states: state,
              );
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17.5),
                  child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "لا تقلق  ما عليك سوى كتابة البريد الالكتروني وسنرسل رمز التحقق.",
                      style: TextsStyle.semibold16
                          .copyWith(color: AppColors.grayscale400),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextformField(
                      keybordetepy: TextInputType.emailAddress,
                      hinttext: "البريد الالكتروني",
                      onsaved: (value) {
                        email = value!;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                        titel: "نسيت كلمة المرور",
                        titelcolor: AppColors.white,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            OpenOtherApps.openAppByPackageName(
                                "com.google.android.gm");
                            formKey.currentState!.save();
                            BlocProvider.of<ForgetpasswordCubit>(context)
                                .forgetpassword(email);
                          }
                        }),
                  ]),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
