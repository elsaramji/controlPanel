// core/exceptions/auth_excaption.dart

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/failure.dart';


class AuthException {
  static Failure firebaseAuthExceptionHandel(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return Failure('كلمة المرور ضعيفة');
    } else if (e.code == 'email-already-in-use') {
      return Failure('البريد الالكتروني مستخدم مسبقا');
    } else if (e.code == 'invalid-email') {
      return Failure('البريد الالكتروني غير صالح');
    } else if (e.code == 'network-request-failed') {
      return Failure('فشل الاتصال بالشبكة');
    } else if (e.code == 'user-not-found') {
      return Failure('البريد الالكتروني غير موجود');
    } else if (e.code == 'wrong-password') {
      return Failure('كلمة المرور غير صحيحة');
    } else if (e.code == 'network-request-failed') {
      return Failure('فشل الاتصال بالشبكة');
    } else if (e.code == 'invalid-credential') {
      return Failure('ربما هناك خطا فى البريد الالكتروني او كلمة المرور');
    } else {
      return Failure("خطأ غير متوقع");
    }
  }

  static Failure unKnownExceptionHandel(Object e) {
    log("$e");
    // return unknown exception and failure

    return Failure("خطأ غير متوقع");
  }
}
