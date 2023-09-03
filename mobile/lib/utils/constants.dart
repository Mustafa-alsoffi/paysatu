import 'package:flutter/material.dart';

class AppColors {
  // Define a linear gradient color as a static variable
  static const Color primaryColor = Colors.white;
  static const LinearGradient gradientColor = LinearGradient(
    colors: [
      Color.fromARGB(235, 3, 3, 210),
      Color.fromARGB(254, 54, 54, 246),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    // Additional properties for the gradient, such as stops, tileMode, etc.
  );

  // Other color constants...
  // Define colors as a map
  static const Map<int, Color> colorMap = {
    50: Color(0xFFFFFFFF),
    100: Color(0xFFEFEFEF),
    200: Color(0xFFD8D8D8),
    300: Color(0xFFC1C1C1),
    400: Color(0xFFAAAAAA),
    500: Color(0xFF939393),
    600: Color(0xFF7C7C7C),
    700: Color(0xFF656565),
    800: Color(0xFF4E4E4E),
    900: Color.fromARGB(255, 20, 20, 20),
  };
}
