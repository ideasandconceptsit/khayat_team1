import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'core/app_themes.dart';
import 'core/translations/app_translations.dart';
import 'state_managment/app_binding.dart';
import 'state_managment/app_pages.dart';
import 'state_managment/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final box = GetStorage();
  String savedLanguage = box.read('language') ?? 'ar';
  runApp(MyApp(local: Locale(savedLanguage)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.local});

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
      initialRoute: Routes.shippingAddressPage, // تغيير هنا حسب الحاجة
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
    );
  }
}
