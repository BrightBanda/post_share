import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryYellow = Color.fromARGB(247, 240, 238, 116);
  static const Color accentOrange = Color.fromARGB(188, 255, 119, 29);

  // A beautiful gradient combining both colors
  static const LinearGradient brandGradient = LinearGradient(
    colors: [primaryYellow, accentOrange],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
