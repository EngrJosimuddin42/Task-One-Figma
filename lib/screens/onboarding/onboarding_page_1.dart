import 'package:flutter/material.dart';
import 'colors_and_constants.dart';
 import 'reusable_widgets.dart';

class OnboardingPage1 extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final VoidCallback onButtonPressed;


  static const double _LARGE_SCROLL_GAP =300.0;

  const OnboardingPage1({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.onButtonPressed,
  });

  // --- Utility Methods  ---
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
    const description = 'Designed for real people balancing\nwork, wellness, and life wherever you are.\n\nImprove your health with smarter insights\n\nTrack your meals, sleep, and activity with\nAI-powered analysis';
    const highlightText = 'Improve your health with smarter insights';
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
                child: StackedCirclesLogo(color1: logoTeal1, color2: primaryTeal,color3: Teal1,),
              ),
              const SizedBox(height: 40),

              // --- Content ---
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Welcome to Gravity', style: TextStyle(color: Colors.white,fontSize: 32,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
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
                    GradientButton(text: 'Next >', onPressed: onButtonPressed),
                    const SizedBox(height: 20),
                    const Text(
                        'No data shared without your consent.',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                        textAlign: TextAlign.center),
                  ],
                ),

            ],
          ),
        ),
      ),
    );
  }
}