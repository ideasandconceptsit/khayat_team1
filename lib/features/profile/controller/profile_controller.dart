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
  RxString userId = "".obs;
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
        userId.value = userModel.value!.id ;

        box.write("userId", userId.value);
       log("✅ [ProfileController] -   يوزر المستخدم تم تخزينه");
      } else {
        SnackbarHelper.showErrorSnackbar("تعذر جلب بيانات المستخدم، حاول مرة أخرى.");
      }
    } catch (e) {
      SnackbarHelper.showErrorSnackbar("حدث خطأ أثناء تحميل البيانات: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  

  
}
