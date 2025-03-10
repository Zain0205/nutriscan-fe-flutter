import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_bloc.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_event.dart';
import 'package:nutriscan_fe_flutter/blocs/auth/auth_state.dart';
import 'package:nutriscan_fe_flutter/utils/app_colors.dart';
import 'package:nutriscan_fe_flutter/widget/registration_button.dart';

class DetailsField extends StatefulWidget {
  final AuthStepTwoState? state;
  const DetailsField({this.state, super.key});

  @override
  State<DetailsField> createState() => _DetailsFieldState();
}

class _DetailsFieldState extends State<DetailsField> {
  String? _selectedValue;
  late TextEditingController _ageController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;

  @override
  void initState() {
    super.initState();
    _ageController =
        TextEditingController(text: widget.state?.age.toString() ?? "");
    _weightController =
        TextEditingController(text: widget.state?.weight.toString() ?? "");
    _heightController =
        TextEditingController(text: widget.state?.height.toString() ?? "");
    _selectedValue = widget.state?.goal;
  }

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
            controller: _ageController,
            onChanged: (value) {
              int? parsedAge = int.tryParse(value);
              context.read<AuthBloc>().add(
                    UpdateRegisterStepTwoField(age: parsedAge),
                  );
            },
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
            controller: _weightController,
            onChanged: (value) {
              double? parsedWeight = double.tryParse(value);
              context.read<AuthBloc>().add(
                    UpdateRegisterStepTwoField(weight: parsedWeight),
                  );
            },
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
            controller: _heightController,
            onChanged: (value) {
              double? parsedHeight = double.tryParse(value);
              context.read<AuthBloc>().add(
                    UpdateRegisterStepTwoField(height: parsedHeight),
                  );
            },
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
          const SizedBox(
            height: 30,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.track_changes_outlined,
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
            value: _selectedValue,
            validator: (value) {
              if (value == null) {
                return 'Please select a goal';
              }
              return null;
            },
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
              context.read<AuthBloc>().add(
                    UpdateRegisterStepTwoField(goal: newValue),
                  );
            },
            items: <String>['Bulking', "Cutting", "Maintenance"]
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          GoBackStepOneEvent(),
                        );
                  },
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
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          RegisterEvent(),
                        );
                  },
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
          const RegistrationButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
