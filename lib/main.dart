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
  const MyApp({super.key,this.local});
  final Locale? local;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  please use the sizes of this package.(screen utils)
    // for example in all the app level:
    // to adjust the  font size : 20.sp
    // to adjust the width size : 20.w
    // to adjust the height size : 20.h
    ScreenUtil.init(context,
        designSize: Size(375, 812), // your design size
     );
    return GetMaterialApp(
      title: 'Khayat',
      translations: AppTranslations(),
      locale: local ?? const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      theme:AppThemes.lightTheme,
      initialRoute: Routes.homePage,
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
    );
  }
}
