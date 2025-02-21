import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart'; // استيراد DevicePreview

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

  runApp(
    DevicePreview(
      enabled: true, // تأكد إنها مفعلة
      builder: (context) => MyApp(local: Locale(savedLanguage)),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.local});

  final Locale? local;

  @override
  Widget build(BuildContext context) {
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
      initialRoute: Routes.shippingAddressPage,
      getPages: AppPages.pages,
      initialBinding: AppBinding(),

      // تفعيل Device Preview
      builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
    );
  }
}
