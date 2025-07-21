import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String routeName = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Onboarding> onboarding = data();
  int index = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemCount: onboarding.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 250,
                          child: Image.asset(onboarding[index].image),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          onboarding[index].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          onboarding[index].describtion,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff6E6A7C),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboarding.length,
                  (dotIndex) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == dotIndex ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == dotIndex
                          ? Colors.deepPurple
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (index < onboarding.length - 1) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      print("Go to Login/Register screen");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Onboarding {
  final String title;
  final String describtion;
  final String image;
  Onboarding({
    required this.describtion,
    required this.image,
    required this.title,
  });
}

List<Onboarding> data() {
  return [
    Onboarding(
      describtion:
          "You can easily manage all of your daily tasks in DoMe for free",
      image: 'asset/images/onboarding-1.png',
      title: 'Manage your tasks',
    ),
    Onboarding(
      describtion:
          "In Tasky you can create your personalized routine to stay productive",
      image: 'asset/images/onboarding-2.png',
      title: 'Create daily routine',
    ),
    Onboarding(
      describtion:
          "You can organize your daily tasks by adding your tasks into categories",
      image: 'asset/images/onboarding-3.png',
      title: 'Organize your tasks',
    ),
  ];
}
