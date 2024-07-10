import 'package:flutter/material.dart';
import 'package:tumora/shared/color_manager.dart';

void navigateTo(context, Widget screen) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ));
}

class TFF extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String label;
  final bool isObsecure;
  final FormFieldValidator<String> validationMassage;
  const TFF(
      {super.key,
      // required this.validator,
      required this.controller,
      required this.label,
      this.keyboardType,
      required this.validationMassage,
      this.isObsecure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validationMassage,
      obscureText: isObsecure,
      keyboardType: keyboardType,
      cursorColor: ColorManager.primary,
      controller: controller,
      decoration: InputDecoration(labelText: label),
    );
  }
}
