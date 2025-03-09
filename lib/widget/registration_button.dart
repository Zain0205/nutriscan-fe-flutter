import "package:flutter/material.dart";

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({required this.isSingleButton, super.key});
  final bool isSingleButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSingleButton
            ? ElevatedButton(
                onPressed: () {},
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
                      onPressed: () {},
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
                      onPressed: () {},
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
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
