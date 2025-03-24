import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:team1_khayat/features/profile/repos/change_user_data_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ChangeUserDataController extends GetxController {
  final ChangeUserDtaRepository _repository;
  ChangeUserDataController(this._repository);

  final box = GetStorage();
  final formKeyChangeUserData = GlobalKey<FormState>();

  final newEmailController = TextEditingController();
  final newNameController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = "".obs;

  Future<bool> changeUserData() async {
    if (!formKeyChangeUserData.currentState!.validate()) {
      print("⚠️ [Controller] فشل التحقق من الفورم.");
      return false;
    }

    isLoading(true);
    errorMessage("");

    try {
      final String? userId = box.read('userId');
      if (userId == null) {
        errorMessage.value = "حدث خطأ في جلب معرف المستخدم.";
        SnackbarHelper.showErrorSnackbar(errorMessage.value);
        return false;
      }

      String? error = await _repository.changeUserData(
        newEmail: newEmailController.text,
        newUsername: newNameController.text,
        userId: userId,
      );

      if (error != null) {
        errorMessage.value = error;
        SnackbarHelper.showErrorSnackbar(error);
        return false;
      }

      print("✅ [Controller] تم تغيير البيانات بنجاح!");
      SnackbarHelper.showSuccessSnackbar("تم تغيير البيانات بنجاح!");
      clearTextFields();
      return true;
    } finally {
      isLoading(false);
    }
  }

  void clearTextFields() {
    newEmailController.clear();
    newNameController.clear();
  }

  @override
  void onClose() {
    newEmailController.dispose();
    newNameController.dispose();
    super.onClose();
  }
}
