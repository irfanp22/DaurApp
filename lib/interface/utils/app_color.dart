import 'package:flutter/material.dart';

class AppColor {
  Map<int, Color> color = {
    50: const Color.fromRGBO(4, 131, 184, .1),
    100: const Color.fromRGBO(4, 131, 184, .2),
    200: const Color.fromRGBO(4, 131, 184, .3),
    300: const Color.fromRGBO(4, 131, 184, .4),
    400: const Color.fromRGBO(4, 131, 184, .5),
    500: const Color.fromRGBO(4, 131, 184, .6),
    600: const Color.fromRGBO(4, 131, 184, .7),
    700: const Color.fromRGBO(4, 131, 184, .8),
    800: const Color.fromRGBO(4, 131, 184, .9),
    900: const Color.fromRGBO(4, 131, 184, 1),
  };
  static const Color primaryColor = Color(0xFF53E88B);
  static const Color headTextColor = Color(0xFF01522C);
  static const Color textColor = Color(0xFF35364F);
  static const Color backgroundColor = Color(0xFFE6EFF9);
  static const Color redColor = Color(0xFFE85050);

  static const defaultPadding = 16.0;
  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor.withOpacity(0.1),
    ),
  );
}
