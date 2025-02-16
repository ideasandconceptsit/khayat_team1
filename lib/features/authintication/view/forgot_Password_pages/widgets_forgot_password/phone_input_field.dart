import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth_controllers/forgot_password_controller.dart';

class PhoneInputField extends StatelessWidget {
  const PhoneInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgotPasswordController controller = Get.find();
    bool isValid = controller.phoneController.text.length == 11;

      return TextFormField(
        controller: controller.phoneController,
        keyboardType: TextInputType.phone,
        onChanged: controller.validatePhone,
        decoration: InputDecoration(
          labelText: "phone".tr,
          prefixText: "+",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: isValid ? Colors.green : Colors.red, // اللون بناءً على الإدخال
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: isValid ? Colors.green : Colors.red,
              width: 2,
            ),
          ),
          suffixIcon: Icon(
            isValid ? Icons.check : Icons.close, // أيقونة النجاح أو الخطأ
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      );
  }
}
