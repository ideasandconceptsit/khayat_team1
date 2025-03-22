import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/language_controller.dart';

class LanguageToggle extends StatelessWidget {
  final LanguageController languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            languageController.currentLanguage.value == 'ar' 
                ? 'العربية  🇪🇬' 
                : 'English 🇺🇸',
            style: AppTextStyles.tajawaltextStyle16,
          ),
          Switch(
            value: languageController.currentLanguage.value == 'ar',
            onChanged: (value) {
              String newLang = value ? 'ar' : 'en';
              languageController.changeLanguage(newLang);
            },
          ),
        ],
      );
    });
  }
}
