import 'package:flutter/material.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';

class CustomOtpInput extends StatelessWidget {
  const CustomOtpInput(
      {super.key, required this.controller, required this.autoFocus});

  final TextEditingController controller;
  final bool autoFocus;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 56,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: ColorPallete.success,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            counterText: '',
            hintStyle: TextStyle(color: ColorPallete.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
