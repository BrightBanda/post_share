import 'package:flutter/material.dart';

class AppSnackbar {
  static void show({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color color = Colors.black,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
