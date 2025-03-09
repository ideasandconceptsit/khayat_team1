import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/features/profile/repos/forget_password_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordRepository forgetPasswordRepository;
  ForgetPasswordController(this.forgetPasswordRepository);

  final GlobalKey<FormState> formKeypassword = GlobalKey<FormState>();
  final emailController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> forgetPassword({required String email}) async {
    print("طلب استعادة كلمة المرور للبريد: $email");

    if (email.isEmpty || !email.contains('@')) {
      print("البريد الإلكتروني غير صالح");
      Get.snackbar('خطأ', 'يرجى إدخال بريد إلكتروني صالح');
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    print("يتم إرسال الطلب إلى ForgetPasswordRepository...");

    String? result =
        await forgetPasswordRepository.forgetPassword(email: email);

    if (result == null) {
      print("تم إرسال الكود بنجاح إلى البريد الإلكتروني");
      SnackbarHelper.showSuccessSnackbar(result ?? 'تم إرسال الكود بنجاح');
    } else {
      errorMessage.value = result;
      print("خطأ في الإرسال: $result");
      SnackbarHelper.showErrorSnackbar(result);
    }

    isLoading(false);
  }
}
