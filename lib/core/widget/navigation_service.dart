import 'package:get/get.dart';

class NavigationService {
  static void to(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void off(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  static void offAll(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }

  static void back() {
    Get.back();
  }
}
