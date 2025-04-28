import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_constants.dart';
import 'core/theme/app_themes.dart';
import 'core/translations/app_translations.dart';
import 'state_managment/app_binding.dart';
import 'state_managment/app_pages.dart';
import 'state_managment/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final box = GetStorage();
  final secureStorage = const FlutterSecureStorage();

  String savedLanguage = box.read('language') ?? 'ar';
  AppConstants.token = await secureStorage.read(key: 'token');
  log("token is $AppConstants.token");
  String initialRoute = AppConstants.token != null ? Routes.bottomNavBar : Routes.splashscreen;

  runApp(MyApp(local: Locale(savedLanguage), initialRoute:initialRoute,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.local ,required this.initialRoute});
  final String initialRoute;

  final Locale? local;

  @override
  Widget build(BuildContext context) {
    // استخدم ScreenUtil لتحديد القياسات عبر التطبيق
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812), // حجم التصميم الأساسي
    );
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khayat',
      translations: AppTranslations(),
      locale: local ?? const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      theme: AppThemes.lightTheme,
      initialRoute: initialRoute,
     // initialRoute, // تغيير هنا حسب الحاجة
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
    );
  }
}
