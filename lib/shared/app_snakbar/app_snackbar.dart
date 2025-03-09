import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showErrorSnackbar(String message, {Color? backgroundColor}) {
    Get.snackbar(
      "خطأ",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor ?? Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 3),
    );
  }

  static void showSuccessSnackbar(String message, {Color? backgroundColor}) {
    Get.snackbar(
      "نجاح",
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor ?? Colors.green, 
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
