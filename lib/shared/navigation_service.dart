import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigationService {
  static void navigateTo(Widget page, {dynamic arguments}) {
    Get.to(page, arguments: arguments);
  }

  static void navigateOff(Widget page, {dynamic arguments}) {
    Get.off(page, arguments: arguments);
  }

  static void navigateOffAll(Widget page, {dynamic arguments}) {
    Get.offAll(page, arguments: arguments);
  }

  static void navigateBack({dynamic result}) {
    Get.back(result: result);
  }

  static void navigateToReplacement(Widget page, {dynamic arguments}) {
    Get.off(page, arguments: arguments);
  }

  static void navigateWithTransition(Widget page, {dynamic arguments, Transition? transition, Duration? duration}) {
    Get.to(page, arguments: arguments, transition: transition, duration: duration);
  }

  

  static void navigateRemoveAllAndTo(Widget page, {dynamic arguments}) {
    Get.offAll(page, arguments: arguments);
  }

  
  static void navigateToNamed(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  static void navigateOffNamed(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  static void navigateOffAllNamed(String route, {dynamic arguments}) {
    Get.offAllNamed(route, arguments: arguments);
  }
}
