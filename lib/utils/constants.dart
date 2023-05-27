import 'package:flutter/material.dart';

class AppColors {
  // Define a linear gradient color as a static variable
  static const LinearGradient gradientColor = LinearGradient(
    colors: [
      Colors.blue,
      Colors.purple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // Additional properties for the gradient, such as stops, tileMode, etc.
  );

  // Other color constants...
  // Define colors as a map
  static const Map<int, Color> colorMap = {
    50: Color(0xFFECECEC),
    100: Color(0xFFD5D5D5),
    200: Color(0xFFBEBEBE),
    300: Color(0xFFA7A7A7),
    400: Color(0xFF909090),
    500: Color(0xFF797979),
    600: Color(0xFF626262),
    700: Color(0xFF4B4B4B),
    800: Color(0xFF343434),
    900: Color(0xFF1D1D1D),
  };
}
