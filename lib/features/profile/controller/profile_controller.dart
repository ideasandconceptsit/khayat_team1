import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:team1_khayat/features/profile/model/get_specific_user_model.dart';
import 'package:team1_khayat/features/profile/repos/profile_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository;
  final box = GetStorage(); 

  ProfileController(this._profileRepository);

  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;
  TextEditingController oldPasswordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      userModel.value = await _profileRepository.fetchUserData("67c3b6e5e2e27877cd10d42b");

      if (userModel.value != null) {
        // box.write("cachedPassword", userModel.value!.password ?? ""); 
        log("✅ [ProfileController] - كلمة المرور القديمة تم تخزينها");
      } else {
        SnackbarHelper.showErrorSnackbar("تعذر جلب بيانات المستخدم، حاول مرة أخرى.");
      }
    } catch (e) {
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل البيانات: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  // bool checkOldPassword() {
  //   String cachedPassword = box.read("cachedPassword") ?? "";
  //   return oldPasswordController.text == cachedPassword;
  // }

  
}
