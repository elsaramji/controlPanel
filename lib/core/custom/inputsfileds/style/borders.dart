// core/custom/inputsfileds/style/borders.dart
import 'package:flutter/material.dart';

class TextfildeBorders {
  static OutlineInputBorder normallyborder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Color(0xFFE6E9E9)),
    );
  }

  static OutlineInputBorder errorborder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Colors.red),
    );
  }
}
