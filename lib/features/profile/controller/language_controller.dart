import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  final box = GetStorage();
  
  RxString currentLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    String savedLang = box.read('language') ?? 'en';
    currentLanguage.value = savedLang;
    Get.updateLocale(Locale(savedLang));
  }

  void changeLanguage(String langCode) {
    currentLanguage.value = langCode; 
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
    box.write('language', langCode);
  }
}
