import "package:flutter/material.dart";

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
