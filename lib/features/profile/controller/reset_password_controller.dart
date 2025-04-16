import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/repos/reset_password_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ResetPasswordController extends GetxController {
  final RestPasswordRepository resetPasswordRepository;
  ResetPasswordController(this.resetPasswordRepository);
   
  final GlobalKey<FormState> formKeyResetPassword = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> resetPassword() async {
    if (!formKeyResetPassword.currentState!.validate()) {
      return;
    }

    String email = emailController.text.trim();
    String newPassword = newPasswordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != confirmPassword) {
      SnackbarHelper.showErrorSnackbar('كلمات المرور غير متطابقة!');
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';

    try {
      String? result = await resetPasswordRepository.restPassword(
        email: email,
        newPassword: newPassword,
      );

      if (result == null) {
        SnackbarHelper.showSuccessSnackbar('تم تغيير كلمة المرور بنجاح');
        clearFields();
      } else {
        errorMessage.value = result;
        SnackbarHelper.showErrorSnackbar(result);
      }
    } catch (e) {
      SnackbarHelper.showErrorSnackbar('حدث خطأ أثناء تغيير كلمة المرور.');
      print("❗ خطأ غير متوقع: $e");
    }

    isLoading.value = false;
  }

  void clearFields() {
    emailController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }
}
