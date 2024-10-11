import 'package:flutter/material.dart';
import 'package:gx_tutorial/forms/custom_button.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Visual search',
            style: TextStyle(
              fontFamily: 'Circular Std',
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/visual.png'),
              fit: BoxFit.cover,
            )),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Search for an outfit by taking a photo or uploading an image",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Circular Std',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      height: 43,
                    ),
                    CustomButton(
                        color: ColorPallete.errorColor,
                        content: const Text(
                          'TAKE A PHOTO',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {}),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        color: Colors.transparent,
                        content: const Text(
                          'UPLOAD AN IMAGE',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'Circular Std',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {}),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
