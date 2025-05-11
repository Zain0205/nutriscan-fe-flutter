import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';
import 'package:nutriscan_fe_flutter/widget/food_item.dart';
import 'package:nutriscan_fe_flutter/widget/nutrient_circle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 15,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text(
                'Today',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: 16),
              Text(
                'Yesterday',
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            // margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '225',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Text(
                      'Calories left',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: 0.85,
                          strokeWidth: 5,
                          backgroundColor: Color.fromARGB(255, 231, 228, 228),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(AppColors.primary),
                        ),
                      ),
                      Icon(
                        Icons.local_dining,
                        size: 25,
                        color: AppColors.primary,
                      ),
                      // Text("50g")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: NutrientCircle(amount: "0g", label: "Protein")),
              Expanded(child: NutrientCircle(amount: "0g", label: "Carbs")),
              Expanded(child: NutrientCircle(amount: "0g", label: "Fat")),
              // NutrientCircle(amount: "ss", label: "ss"),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recently uploaded',
                style: TextStyle(
                  // color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              FoodItem(
                imagePath: 'assets/images/naspad.jpeg',
                name: 'Nasi Padang',
                time: '11:31am',
                calories: '634',
                protein: '27g',
                carbs: '62g',
                fat: '30g',
              ),
              FoodItem(
                imagePath: 'assets/images/soto.jpeg',
                name: 'Soto Ayam',
                time: '17:31am',
                calories: '334',
                protein: '22g',
                carbs: '32g',
                fat: '12g',
              ),
            ],
          ),
        ),

        // Food items

        const SizedBox(height: 16),
      ],
    );
  }
}
