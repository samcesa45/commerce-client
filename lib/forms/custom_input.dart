import 'package:flutter/material.dart';
import 'package:gx_tutorial/themes/color_pallete.dart';
import 'package:gx_tutorial/controllers/custom_input_controller.dart';
import 'package:get/get.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      required this.label,
      this.type = false,
      required this.editingController});
  final String label;
  final bool type;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    final CustomInputController controller = Get.put(CustomInputController());
    return PhysicalModel(
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.black12,
      child: Obx(
        () => TextFormField(
          controller: editingController,
          obscureText: type ? !controller.isPasswordVisible.value : false,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            label: Text(
              label,
              style: const TextStyle(
                  fontFamily: 'Circular Std',
                  fontSize: 14,
                  color: ColorPallete.grey),
            ),
            suffixIcon: type
                ? IconButton(
                    icon: Icon(
                      controller.isPasswordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorPallete.success,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  )
                : controller.isEmailValid.value
                    ? const Icon(
                        Icons.check,
                        color: ColorPallete.success,
                      )
                    : const SizedBox.shrink(),
            focusedBorder: controller.isEmailValid.value
                ? InputBorder.none
                : const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: ColorPallete
                          .errorColor, // Red border on invalid email
                    ),
                  ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: controller.isEmailValid.value
                      ? Colors.white
                      : ColorPallete.errorColor),
            ),
          ),
          onChanged: (value) {
            if (!type) {
              controller.validateEmail(value);
            }
          },
        ),
      ),
    );
  }
}
