import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget buildSignupAppBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      onPressed: () => Get.back(),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
