import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  static Future<dynamic> goto(context, page) {
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
  }

  static void replace(context, page) {
    Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) => page));
  }

  static void dismiss(context, {dynamic value}) {
    if (value != null)
      Navigator.pop(context, value);
    else
      Navigator.pop(context);
  }
}
