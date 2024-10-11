import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.content,
      required this.onPressed,
      required this.color});
  final Widget content;
  final VoidCallback onPressed;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(25)),
                side: BorderSide( color: Colors.white))),
            backgroundColor: WidgetStateProperty.all(color),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 14),
            ),
            // shadowColor: WidgetStateProperty.all(ColorPallete.grey),

            elevation: WidgetStateProperty.all(1.0),
          ),
          onPressed: onPressed,
          child: content),
    );
  }
}
