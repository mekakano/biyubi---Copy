import 'package:biyubi/components/text_field_container.dart';
import 'package:biyubi/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon2;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final FormFieldValidator validatorwoi;
  const RoundedInputField(
      {Key? key,
      required this.hintText,
      required this.icon2,
      required this.validatorwoi,
      required this.onChanged,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validatorwoi,
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon2,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
