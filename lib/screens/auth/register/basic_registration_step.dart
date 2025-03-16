import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_event.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_state.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';
import 'package:nutriscan_fe_flutter/widget/registration_button.dart';

class BasicRegistrationStep extends StatefulWidget {
  final AuthStepOneState? state;

  const BasicRegistrationStep({this.state, super.key});

  @override
  State<BasicRegistrationStep> createState() => _BasicRegistrationStepState();
}

class _BasicRegistrationStepState extends State<BasicRegistrationStep> {
  final _key = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.state?.name ?? "");
    _emailController = TextEditingController(text: widget.state?.email ?? "");
    _passwordController =
        TextEditingController(text: widget.state?.password ?? "");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _key,
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
            TextFormField(
              controller: _nameController,
              onChanged: (value) {
                context.read<AuthBloc>().add(
                      UpdateRegisterStepOneField(name: value),
                    );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
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
            TextFormField(
              controller: _emailController,
              onChanged: (value) {
                context.read<AuthBloc>().add(
                      UpdateRegisterStepOneField(email: value),
                    );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
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
            TextFormField(
              controller: _passwordController,
              onChanged: (value) {
                context.read<AuthBloc>().add(
                      UpdateRegisterStepOneField(password: value),
                    );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
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
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        RegisterStepOne(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );

                  context.read<AuthBloc>().add(
                        RegisterStepTwo(
                          age: null,
                          weight: null,
                          height: null,
                          goal: null,
                        ),
                      );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  50,
                ),
              ),
              child: const Text('Next'),
            ),
            const RegistrationButton(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
