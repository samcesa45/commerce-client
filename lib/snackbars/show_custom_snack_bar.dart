import 'package:flutter/material.dart';

class ShowCustomSnackBar extends StatelessWidget {
  const ShowCustomSnackBar(
      {super.key, required this.message, required this.title});

  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(content: Text(message));
    return Scaffold(
      body: SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: title,
          onPressed: () {
            // Some code to undo the change.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
