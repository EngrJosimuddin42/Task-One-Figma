import 'package:flutter/material.dart';
import 'colors_and_constants.dart';

// --- REUSABLE CUSTOM WIDGETS ---

class StackedCirclesLogo extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  const StackedCirclesLogo({super.key, required this.color1, required this.color2,required this.color3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 160, height: 160,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color1),
        child: Center(
          child: Container(
            width: 120, height: 120,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color2),
            child: Center(
              child: Container(
                width: 80, height: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320, height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [buttonColorStart, buttonColorEnd],
            begin: Alignment.centerLeft, end: Alignment.centerRight),
        ),
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
            child: Text(text)
        ),
      ),
    );
  }
}