import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/features/authintication/repo/login_repo.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/shared/bottom_navigation_bar/view/buttom_nav_bar.dart';
import '../model/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;
  var userModel = UserModel().obs;
  final secureStorage = FlutterSecureStorage();
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  final formkey = GlobalKey<FormState>();
  void validateEmail(String value) {
    isEmailValid.value = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value);
  }
  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 6;
  }
  Future<void> fetchUserData(String email,String password) async {
    final LoginRepository _userRepository = LoginRepository(ApiService());
    try {
      isLoading.value = true;
      print("🟡 [LoginController] - جاري تحميل البيانات...");
      final fetchUser = await _userRepository.getUserData(email,password);
      if (fetchUser != null ) {
        userModel.value=fetchUser;
        await secureStorage.write(key: 'token', value:fetchUser.token);
        //await secureStorage.write(key: 'password', value: passwordController.text);
        print("✅ [LoginController] - تم تحميل ${_userRepository} طلب.");
       // SnackbarHelper.showSuccessSnackbar("تم تحميل البيانات بنجاح.");
        Get.offAll(() =>BottomNavBar());
      } else {
        print("⚠️ [LoginController] - لم يتم العثور على أي بيانات.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي بيانات.");
      }
    } catch (e) {
      print("❌ [LoginController] - خطأ أثناء تحميل بيانات: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل البيانات حاول مرة أخرى.");
    } finally {
      isLoading.value = false;
      print("🔵 [LoginController] - انتهى تحميل البياتات.");
    }
  }
}
