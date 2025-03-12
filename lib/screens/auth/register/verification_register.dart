// import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_event.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_state.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';

class VerificationRegister extends StatefulWidget {
  final AuthOtpVerification? state;
  const VerificationRegister({this.state, super.key});

  @override
  State<VerificationRegister> createState() => _VerificationRegisterState();
}

class _VerificationRegisterState extends State<VerificationRegister> {
  final List<FocusNode> otpFocusNode = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> otpControllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    super.dispose();
  }

  bool _handleKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      for (int index = 0; index < 4; index++) {
        if (otpFocusNode[index].hasFocus) {
          if (otpControllers[index].text.isEmpty && index > 0) {
            setState(() {
              otpControllers[index - 1].clear();
              otpFocusNode[index - 1].requestFocus();
            });
          }
          break;
        }
      }
    }
    return false; // Return false agar tidak mengganggu event lainnya
  }

  String _getOtpValue() {
    return otpControllers.map((e) => e.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: Text(
              "We have just sent four magic digits to your email, please enter the code below",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Icon(
            Icons.mark_email_read_outlined,
            size: 60,
            color: AppColors.primary,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => SizedBox(
                width: 60,
                child: TextField(
                  controller: otpControllers[index],
                  focusNode: otpFocusNode[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  decoration: InputDecoration(
                    counterText: "",
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
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      if (index < 3) {
                        otpFocusNode[index + 1].requestFocus();
                      } else {
                        otpFocusNode[index].unfocus();
                      }
                    }

                    context.read<AuthBloc>().add(
                          OtpVerification(otp: _getOtpValue()),
                        );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(OtpVeryficationSubmitEvent());
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(
                double.infinity,
                50,
              ),
            ),
            child: Text('${widget.state?.email}'),
          ),
        ],
      ),
    );
  }
}
