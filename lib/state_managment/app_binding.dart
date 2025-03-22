import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/controller/language_controller.dart';

import 'app_state_controller.dart';


class AppBinding implements Bindings {
  @override
  void dependencies() {
     Get.put<AppStateController>(AppStateController());
     Get.put<LanguageController>(LanguageController());

  }
}