// core/custom/inputsfileds/logic/function.dart
import 'package:flutter/material.dart';

class LogicFunction {
  static String? vaildator(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }
}

class VisibilIconsInFelides {
  static List<Icon> visiibleIcons = const [
    Icon(Icons.visibility_off),
    Icon(Icons.visibility),
  ];
}
