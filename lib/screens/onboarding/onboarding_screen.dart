import 'package:flutter/material.dart';
import 'onboarding_page_1.dart';
import 'onboarding_page_2.dart';
import 'onboarding_page_3.dart';

// --- ONBOARDING FLOW (Page Controller & Dot Indicator) ---

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int pageCount = 3;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_updatePage);
  }

  void _updatePage() {
    if (_pageController.page != null) {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePage);
    _pageController.dispose();
    super.dispose();
  }


// --- Crucial Navigation Logic Here ---
  void _handleButtonPress(int index) {
    if (index < pageCount - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage1(
                currentPage: _currentPage,
                pageCount: pageCount,
                onButtonPressed: () => _handleButtonPress(0),
              ),
              OnboardingPage2(
                currentPage: _currentPage,
                pageCount: pageCount,
                onButtonPressed: () => _handleButtonPress(1),
              ),
              OnboardingPage3(
                currentPage: _currentPage,
                pageCount: pageCount,
                onButtonPressed: () => _handleButtonPress(2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}