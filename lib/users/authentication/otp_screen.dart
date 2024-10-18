import 'package:flutter/material.dart';
import 'package:gx_tutorial/controllers/auth_controller.dart';
import 'package:gx_tutorial/forms/custom_button.dart';
import 'package:gx_tutorial/forms/custom_otp_input.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _fieldOne = TextEditingController();
    var _fieldTwo = TextEditingController();
    var _fieldThree = TextEditingController();
    var _fieldFour = TextEditingController();
    var _fieldFive = TextEditingController();

    void _requestSendOtp(AuthController authController) {
      final String otp  = _fieldOne.text + _fieldTwo.text + _fieldThree.text 
      + _fieldFour.text + _fieldFive.text;

      if (otp.length < 5) {
        Get.snackbar("Error", "Your Pin is not correct");
      } else {
        print(otp);
        authController.verifyOtp(otp);
      }
    }

    return Scaffold(
      backgroundColor: ColorPallete.mainBgColor,
      body: GetBuilder<AuthController>(builder: (authController) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter Otp Screen',
                  style: TextStyle(
                      fontFamily: 'Circular Std',
                      fontSize: 34,
                      color: ColorPallete.black,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 73,
                ),
                const Center(
                    child: Image(image: AssetImage('images/email_img.png'))),
                const SizedBox(
                  height: 32,
                ),
                const Center(
                  child: Text(
                    'Enter Otp',
                    style: TextStyle(
                        fontFamily: 'Circular Std',
                        fontSize: 34,
                        color: ColorPallete.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Enter the OTP code we just sent you on your registered Email',
                  style: TextStyle(
                      color: ColorPallete.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Circular Std'),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomOtpInput(controller: _fieldOne, autoFocus: true),
                    CustomOtpInput(controller: _fieldTwo, autoFocus: false),
                    CustomOtpInput(controller: _fieldThree, autoFocus: false),
                    CustomOtpInput(controller: _fieldFour, autoFocus: false),
                    CustomOtpInput(controller: _fieldFive, autoFocus: false),
                  ],
                ),
                const SizedBox(
                  height: 55,
                ),
                Obx(() => CustomButton(
                      color: ColorPallete.errorColor,
                      content: authController.isLoading.value
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: 'Circular Std',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      onPressed: () => _requestSendOtp(authController),
                    )),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Text(
                      "Didn’t get OTP?",
                      style: TextStyle(
                          color: ColorPallete.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Circular Std'),
                    ),
                    TextButton(
                      child: const Text('Resend OTP'),
                      onPressed: () => {},
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
