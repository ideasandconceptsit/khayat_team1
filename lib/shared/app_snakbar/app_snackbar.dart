import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

void showSuccessSnackBar(String message) {
  Get.snackbar(
    'Success',
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  );
}

void showErrorSnackBar(String message) {
  Get.snackbar(
    'Error',
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 2),
  );
}