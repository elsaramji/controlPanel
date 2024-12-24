// core/models/user_entity.dart

import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Usermodel {
  final String? name;
  final String email;
  final String? uid;

  Usermodel({required this.name, required this.email, required this.uid});
  toMap() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
    };
  }

  factory Usermodel.fromFirebase(User user, {String? name}) {
    return Usermodel(
      name: user.displayName ?? name,
      email: user.email!,
      uid: user.uid,
    );
  }

  factory Usermodel.fromMap(Map<String, dynamic>? map) {
    return Usermodel(
      name: map!['name'],
      email: map['email'],
      uid: map['uid'],
    );
  }

  factory Usermodel.fromString(String data) {
    log(data);
    return Usermodel.fromMap(jsonDecode(data));
  }
}
