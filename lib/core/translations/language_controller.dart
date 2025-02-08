import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
class LanguageController extends GetxController {
  final box = GetStorage();

  void changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    box.write('language', langCode);
  }
}
