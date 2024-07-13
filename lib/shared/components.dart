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

// ignore: must_be_immutable
class CardBuilder extends StatelessWidget {
  final bool startAnimation;
  final double screenWidth;
  final int index;
  final String? imageUrl;
  final String? drName;
  final String? drMajor;
  void Function()? ontap;
  CardBuilder(
      {super.key,
      required this.screenWidth,
      required this.index,
      required this.imageUrl,
      required this.drName,
      required this.drMajor,
      required this.startAnimation,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300 + (index * 300)),
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                color: ColorManager.greydark,
                blurRadius: 5,
                offset: const Offset(-3, 3))
          ],
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: ColorManager.secondary,
        ),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                  width: 100,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(imageUrl!)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //todo doc name and time from api

                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        drName!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        drMajor!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      //stars rating row
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_border,
                          ),
                          Icon(
                            Icons.star_border,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
