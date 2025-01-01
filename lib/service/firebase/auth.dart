// service/firebase/auth.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:furits_control/core/exceptions/auth_excaption.dart';

import '../../core/errors/failure.dart';
import '../../core/models/user_entity.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late Usermodel usermodel;

  Future<Either<Failure, Usermodel>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fetch admin data from Firestore
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
          .instance
          .collection('admins')
          .doc(userCredential.user!.uid)
          .get();

      if (doc.exists) {
        return right(Usermodel.fromFirebase(userCredential.user!));
      } else {
        return left(Failure('هذا المستخدم ليس مسؤول'));
      }
    } on FirebaseAuthException catch (e) {
      return left(AuthException.firebaseAuthExceptionHandel(e));
    } catch (e) {
      return left(Failure('خطأ في تسجيل الدخول'));
    }
  }

  bool isLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }

  Future forgetpassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
