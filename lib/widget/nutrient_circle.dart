import 'package:flutter/material.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class NutrientCircle extends StatelessWidget {
  const NutrientCircle({required this.amount, required this.label, super.key});
  final String label;
  final String amount;
  final Color color = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(vertical: 8),
      // HAPUS width: double.infinity
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    value: 0.99,
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
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black, // ganti putih biar kelihatan
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          ),
          const Text(
            'left',
            style: TextStyle(
              color: AppColors.gray,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
