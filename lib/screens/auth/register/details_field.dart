import 'package:flutter/material.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class DetailsField extends StatefulWidget {
  const DetailsField({super.key});

  @override
  State<DetailsField> createState() => _DetailsFieldState();
}

class _DetailsFieldState extends State<DetailsField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Text(
                "Now, let's complete your profile by filling in the details below",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Input Your Age",
              prefixIcon: const Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 236, 236, 236),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Input Your Body Weight",
              prefixIcon: const Icon(
                Icons.monitor_weight_outlined,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 236, 236, 236),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Input Your Height",
              prefixIcon: const Icon(
                Icons.height_outlined,
                color: Colors.grey,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 236, 236, 236),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey.shade500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
