import 'package:flutter/material.dart';
import 'colors_and_constants.dart';
import 'reusable_widgets.dart';

class OnboardingPage3 extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onButtonPressed;

  static const double _LARGE_SCROLL_GAP = 350.0;

  const OnboardingPage3({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onButtonPressed,
  });

  // --- Utility Methods ---

  Widget _buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 6,
      width: currentPage == index ? 25 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.orangeAccent : Colors.white54,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  List<TextSpan> _buildColoredTextSpans() {
    const description = 'Monitor sleep,hydration,and daily activity\n\n Get a complete picture of your health journey';
    const highlightText = 'Monitor sleep,hydration,and daily activity';
    final baseStyle = const TextStyle(color: Colors.white54, fontSize: 16);
    final highlightStyle = const TextStyle(color: Colors.orangeAccent, fontSize: 16);

    final parts = description.split(highlightText);
    return [
      TextSpan(text: parts[0], style: baseStyle),
      TextSpan(text: highlightText, style: highlightStyle),
      TextSpan(text: parts[1], style: baseStyle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryDarkBlue, primaryTeal],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(24.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),

              // --- Logo Area ---
              Center(
                // Note: Assuming logoTeal1 and logoDeepBlue are defined
                child: StackedCirclesLogo(color1: logoDeepBlue, color2: Blue,color3:CardColor),
              ),
              const SizedBox(height: 40),

              // --- Content ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Complete Wellness\n Tracking', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text.rich(TextSpan(children: _buildColoredTextSpans()),textAlign: TextAlign.center),

                  const SizedBox(height: _LARGE_SCROLL_GAP),
                ],
              ),

              // --- Scrollable Indicator ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pageCount,(index) => _buildDot(index),
                ),
              ),
              const SizedBox(height: 20),

              // --- Button and Footer ---
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GradientButton(text: 'Get Started >', onPressed: onButtonPressed),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}