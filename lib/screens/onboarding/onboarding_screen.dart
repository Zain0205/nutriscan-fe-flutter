import 'package:flutter/material.dart';
import 'package:nutriscan_fe_flutter/models/onboarding_item.dart';
import 'package:nutriscan_fe_flutter/screens/onboarding/onboarding_page.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  int currentPage = 0;

  final List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      title: 'Eat Healthy',
      description:
          'Maintaining good health should be the primary focus of everyone.',
      image: 'assets/images/onboard1.jpg',
    ),
    OnboardingItem(
      title: 'Healthy Recipes',
      description:
          'Browse thousands of healthy recipes from all over the world.',
      image: 'assets/images/onboard2.jpg',
    ),
    OnboardingItem(
      title: 'Healthy Recipes',
      description:
          'Browse thousands of healthy recipes from all over the world.',
      image: 'assets/images/onboard3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "NutriScan",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: PageView.builder(
              controller: controller,
              itemCount: onboardingItems.length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (conte, index) => OnboardingPage(
                item: onboardingItems[index],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller,
                    count: onboardingItems.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primary,
                      dotColor: AppColors.gray,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Get Started"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
