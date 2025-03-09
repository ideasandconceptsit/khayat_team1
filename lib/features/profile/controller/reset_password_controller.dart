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

  Future<void> resetPassword({required String email, required String newPassword}) async {
    print("طلب استعادة كلمة المرور للبريد: $email");

    if (email.isEmpty || !email.contains('@')) {
      print("البريد الإلكتروني غير صالح");
      Get.snackbar('خطأ', 'يرجى إدخال بريد إلكتروني صالح');
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    print("يتم إرسال الطلب إلى RestPasswordRepository...");

    String? result =
        await resetPasswordRepository.restPassword(email: email, newPassword: newPassword);

    if (result == null) {
      print("تم تغيير كلمة المرور بنجاح");
      SnackbarHelper.showSuccessSnackbar('تم تغيير كلمة المرور بنجاح');
    } else {
      errorMessage.value = result;
      print("خطأ في الإرسال: $result");
      SnackbarHelper.showErrorSnackbar(result);
    }

    isLoading.value = false;
  }
}
