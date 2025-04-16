import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/features/authintication/repo/signup_repo.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var isLoading = false.obs;

  void validateEmail(String value) {
    isEmailValid.value = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$").hasMatch(value);
  }

  void validatePassword(String value) {
    isPasswordValid.value = value.length >= 6;
  }
  Future<void> addUserData(String email,String password,String name) async {
    final SignUpRepository _userRepository = SignUpRepository(ApiService());
    try {
      isLoading.value = true;
      print("🟡 [SignupController] - جاري تحميل البيانات...");
      final fetchUser = await _userRepository.addUserData(email,password,name);
      if (fetchUser == 201 ) {
       // userModel.value=fetchUser;
        print("✅ [SignupController] - تم تحميل ${_userRepository} طلب.");
        // SnackbarHelper.showSuccessSnackbar("تم تحميل البيانات بنجاح.");
        Get.toNamed(Routes.loginPage);
      } else {
        print("⚠️ [SignupController] - لم يتم العثور على أي بيانات.");
        SnackbarHelper.showErrorSnackbar("لم يتم العثور على أي بيانات.");
      }
    } catch (e) {
      print("❌ [SignupController] - خطأ أثناء تحميل بيانات: $e");
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل البيانات حاول مرة أخرى.");
    } finally {
      isLoading.value = false;
      print("🔵 [SignupController] - انتهى تحميل البياتات.");
    }
  }
}
