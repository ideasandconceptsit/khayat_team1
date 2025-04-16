import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/repos/change_password-repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordRepository _repository;

  ChangePasswordController(this._repository);

  final formKeyChangePassword = GlobalKey<FormState>();
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = "".obs;

  Future<bool> changeUserData() async {
    if (!formKeyChangePassword.currentState!.validate()) {
      print("⚠️ [Controller] فشل التحقق من الفورم.");
      return false;
    }

    isLoading.value = true;
    errorMessage.value = "";
    print("🔵 [Controller] بدء عملية تغيير كلمة المرور...");

    String? error = await _repository.changePassword(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );

    isLoading.value = false;

    if (error != null) {
      print("❌ [Controller] فشل تغيير كلمة المرور: $error");
      errorMessage.value = error;
     SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تغيير كلمة المرور، حاول مرة أخرى.");
      return false;
    }

    print("✅ [Controller] تم تغيير كلمة المرور بنجاح!");
    SnackbarHelper.showSuccessSnackbar("تم تغيير كلمة المرور بنجاح!");
clearTextFields();
    return true;
  }
 

  void clearTextFields() {
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
 
}
