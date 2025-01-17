// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:furits_control/core/injection/get_it.dart';
import 'package:furits_control/service/firebase/auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'components/auth/signin/view/view.dart';
import 'core/helper/on_generate.dart';
import 'core/styles/color_style.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'DEFAULT',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Supabase.initialize(
    url: 'https://mxtehujekjicckxdlxzi.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im14dGVodWpla2ppY2NreGRseHppIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUwMjk1MDIsImV4cCI6MjA1MDYwNTUwMn0.8yXA0Dlztz7yJ4ttz5reL0I0K6WMqmq56pKbgV25kkg',
  );

  setupGetIt();

  runApp(StoreControle());
}

class StoreControle extends StatelessWidget {
  final FirebaseAuthService authService = getIt<FirebaseAuthService>();
  StoreControle({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: AppColors.primaryWhite,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryWhite,
          scrolledUnderElevation: 0,
          centerTitle: true,
        ),
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: S.delegate.supportedLocales[1],
      debugShowCheckedModeBanner: false,
      onGenerateRoute: ongenerate,
      initialRoute: SigninAsAdmin.route,
      home: SigninAsAdmin(),
    );
  }
}
