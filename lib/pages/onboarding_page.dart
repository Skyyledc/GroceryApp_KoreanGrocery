import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingPage(),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class OnboardingItem {
  final String title;
  final String description;
  final String image;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "Welcome to the App",
      description: "This is the description for the first screen.",
      image: 'assets/images/Greeting1.png',
    ),
    OnboardingItem(
      title: "Explore Features",
      description: "Learn about the amazing features of our app.",
      image: 'assets/images/Greeting2.png',
    ),
    OnboardingItem(
      title: "Get Started",
      description: "It's time to get started and enjoy the app.",
      image: 'assets/images/Logo1.png',
    ),
  ];

  double _currentIndex = 0;

  Color getButtonColor() {
    if (_currentIndex < onboardingItems.length - 1) {
      return Colors.pink.shade200;
    } else {
      return Colors.pink.shade200;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingItems.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index.toDouble();
              });
            },
            itemBuilder: (context, index) {
              return OnboardingItemWidget(
                  onboardingItem: onboardingItems[index]);
            },
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      buildDot(_currentIndex.toInt()), // Pass the current index
                ),
                const SizedBox(height: 20),
                if (_currentIndex == onboardingItems.length - 1)
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the login screen.
                        Navigator.pushNamed(context, '/loginscreen');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(getButtonColor()),
                      ),
                      child: Text("Get Started",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                if (_currentIndex < onboardingItems.length - 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Skip button should navigate to the login screen directly.
                          _pageController.animateToPage(
                            onboardingItems.length - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.poppins(
                            color: Colors.pink[200],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Move to the next onboarding screen.
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(getButtonColor()),
                        ),
                        child: Text(
                          "Next",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          // Move the DotsIndicator widget here
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return SmoothPageIndicator(
      controller: _pageController,
      count: onboardingItems.length,
      effect: ScrollingDotsEffect(
        dotColor: Colors.grey.shade300,
        activeDotColor: Colors.pink.shade300,
        spacing: 15,
        dotWidth: 12,
        dotHeight: 12,
        activeStrokeWidth: 2.6,
        activeDotScale: 1.4,
      ),
    );
  }
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem onboardingItem;

  const OnboardingItemWidget({super.key, required this.onboardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(onboardingItem.image),
        const SizedBox(height: 20),
        Text(
          onboardingItem.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(
          onboardingItem.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
