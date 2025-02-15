import 'package:flutter/material.dart';
import 'package:nutriscan_fe_flutter/models/onboarding_item.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.item});
  final OnboardingItem item;

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Image.asset(
            item.image,
            height: 300,
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            item.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            item.description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.gray,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
