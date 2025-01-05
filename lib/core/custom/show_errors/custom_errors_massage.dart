import 'package:flutter/material.dart';

class ErrorsMassage {
  static void errorsBar(context, massage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage),
    ));
  }
}