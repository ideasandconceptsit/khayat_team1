import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:team1_khayat/core/theme/app_themes.dart';
import 'package:device_preview/device_preview.dart';
import 'core/translations/app_translations.dart';
import 'state_managment/app_binding.dart';
import 'state_managment/app_pages.dart';
import 'state_managment/app_routers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final box = GetStorage();
  String savedLanguage = box.read('language') ?? 'en';
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => MyApp(local: Locale(savedLanguage)),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.local});
  final Locale? local;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Khayat',
          translations: AppTranslations(),
          // locale: local ?? const Locale('en'),
          // fallbackLocale: const Locale('en'),
          
          theme: AppThemes.lightTheme,
          initialRoute: Routes.bottomNavBar,
          getPages: AppPages.pages,
          initialBinding: AppBinding(),
          builder: DevicePreview.appBuilder,
        );
      },
    );
  }
}
