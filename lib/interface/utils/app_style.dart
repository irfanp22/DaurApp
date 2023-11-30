import 'package:flutter/material.dart';

class AppStyle {
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
  static const Color primaryGradient = Color.fromARGB(255, 37, 197, 99);
  static const Color secondaryGradient = Color.fromARGB(255, 137, 235, 175);
  static const Color headTextColor = Color(0xFF01522C);
  static const Color textColor = Colors.white;
  static const Color backgroundColor = Color(0xFFE6EFF9);
  static const Color redColor = Color(0xFFE85050);
  static const Color redSecondary = Color.fromARGB(255, 213, 125, 125);

  static const defaultPadding = 16.0;
  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: primaryColor.withOpacity(0.1),
    ),
  );

  static BoxDecoration buildGradientDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AppStyle.primaryGradient,
          AppStyle.secondaryGradient,
        ],
        stops: [0.3, 0.9],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );
  }

  static Widget buildMenuItem(
      IconData icon, String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryGradient, secondaryGradient],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Icon(icon, size: 24, color: textColor),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: const TextStyle(color: headTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
