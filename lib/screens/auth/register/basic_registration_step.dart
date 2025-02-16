import 'package:flutter/material.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class BasicRegistrationStep extends StatelessWidget {
  const BasicRegistrationStep({super.key});

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
                "Let's Start With The Basic, Note: You Can Change This Later",
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
              hintText: "Input Your Full Name",
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
              hintText: "Input Your Email",
              prefixIcon: const Icon(
                Icons.email_outlined,
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
              hintText: "Input Your Password",
              prefixIcon: const Icon(
                Icons.lock_outline,
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
