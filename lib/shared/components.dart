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

class DefultButton extends StatelessWidget {
  final String text;
  final void Function()? onpressed;

  const DefultButton({super.key, required this.onpressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        splashColor: ColorManager.splash,
        textColor: ColorManager.white,
        color: ColorManager.primary,
        height: 30,
        onPressed: onpressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class MyDropDown extends StatelessWidget {
  final String? initianlValue;
  final String hint;

  final List valuesList;
  final void Function(String?) doSetStateHere;

  const MyDropDown(
      {super.key,
      required this.initianlValue,
      required this.valuesList,
      required this.doSetStateHere,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.grey,
          border: Border.all(color: Colors.grey, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: DropdownButton<String?>(
          // isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          underline: const SizedBox(),
          hint: Text(hint),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          value: initianlValue,
          onChanged: doSetStateHere,
          //List Items
          items: valuesList.map(
            (e) {
              return DropdownMenuItem(
                value: e.toString(),
                child: Text(e),
              );
            },
          ).toList()),
    );
  }
}
