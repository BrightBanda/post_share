import 'package:flutter/material.dart';

class SubmitButtton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const SubmitButtton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
