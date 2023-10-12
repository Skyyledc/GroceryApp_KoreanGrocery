import 'package:flutter/material.dart';
import 'package:groceryapp/Pages/login_page.dart';

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

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: "Welcome to My App",
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

  int currentIndex = 0;

  Color getButtonColor() {
    if (currentIndex < onboardingItems.length - 1) {
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
                currentIndex = index;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingItems.length,
                    (index) => buildDot(index),
                  ),
                ),
                const SizedBox(height: 20),
                if (currentIndex == onboardingItems.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/loginscreen');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(getButtonColor()),
                    ),
                    child: const Text("Get Started"),
                  ),
                if (currentIndex < onboardingItems.length - 1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            onboardingItems.length - 1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Color.fromARGB(255, 244, 143, 177),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(getButtonColor()),
                        ),
                        child: const Text("Next"),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? Colors.pink[200] : Colors.grey,
      ),
    );
  }
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
