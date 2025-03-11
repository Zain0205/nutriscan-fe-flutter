// import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:nutriscan_fe_flutter/blocs/auth/auth_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_state.dart';

import 'package:nutriscan_fe_flutter/screens/auth/register/basic_registration_step.dart';
import 'package:nutriscan_fe_flutter/screens/auth/register/details_field.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';
// import 'package:nutriscan_fe_flutter/screens/auth/register/verification_register.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final int _currentStep = 1;
  final int _totalSteps = 3;

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
                      BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("err"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (state is AuthSuccess) {
                            context.go("/main");
                          }
                        },
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is AuthStepOneState) {
                            return BasicRegistrationStep(state: state);
                          } else if (state is AuthStepTwoState) {
                            return DetailsField(state: state);
                          }

                          return const BasicRegistrationStep();
                        },
                      ),
                      // const VerificationRegister(),
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
