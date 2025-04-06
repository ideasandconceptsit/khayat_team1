import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static Future<void> show(IconData icon,  String type, String message , Color backgroundColor) {
    Get.snackbar(
        animationDuration: const Duration(milliseconds: 500),
        forwardAnimationCurve: Curves.easeInOut,
        icon: Icon(icon),
        padding: const EdgeInsets.all(10),
        reverseAnimationCurve: Curves.linear,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        colorText: Colors.white,
         isDismissible: true,
     type,
        message,
        backgroundColor: backgroundColor,
      );
    return Future.value();
  }
}
