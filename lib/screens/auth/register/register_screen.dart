import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:nutriscan_fe_flutter/screens/auth/register/basic_registration_step.dart';
import 'package:nutriscan_fe_flutter/screens/auth/register/details_field.dart';
import 'package:nutriscan_fe_flutter/screens/auth/register/verification_register.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentStep = 1;
  final _totalSteps = 3;

  void nextStep() {
    if (_currentStep < _totalSteps) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "NutriScan",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Text(
                              _currentStep == 1
                                  ? "The Basic"
                                  : _currentStep == 2
                                      ? "Details"
                                      : "Verification",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '$_currentStep/$_totalSteps',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      _currentStep == 1
                          ? const BasicRegistrationStep()
                          : _currentStep == 2
                              ? const DetailsField()
                              : const VerificationRegister(),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            _currentStep == 1
                                ? ElevatedButton(
                                    onPressed: nextStep,
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(
                                        double.infinity,
                                        50,
                                      ),
                                    ),
                                    child: const Text('Next'),
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: previousStep,
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(
                                              double.infinity,
                                              50,
                                            ),
                                          ),
                                          child: const Text('Previous'),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: nextStep,
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(
                                              double.infinity,
                                              50,
                                            ),
                                          ),
                                          child: const Text('Next'),
                                        ),
                                      ),
                                    ],
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?"),
                                TextButton(
                                  onPressed: () {
                                    context.push("/login");
                                  },
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
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
