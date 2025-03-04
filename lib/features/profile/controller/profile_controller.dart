import 'dart:developer';

import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/model/get_specific_user_model.dart';
import 'package:team1_khayat/features/profile/repos/profile_repository.dart';

class ProfileController extends GetxController {
  final ProfileRepository _profileRepository;

  ProfileController(this._profileRepository);

  Rx<UserModel?> userModel = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("🔵 [ProfileController] - بدأ `onInit`، سيتم جلب بيانات المستخدم...");
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      log("🟡 [ProfileController] - بدء تحميل بيانات المستخدم...");

      userModel.value = await _profileRepository.fetchUserData("67c3b6e5e2e27877cd10d42b");

      if (userModel.value == null) {
        showError("تعذر جلب بيانات المستخدم، حاول مرة أخرى.");
      } else {
        log("✅ [ProfileController] - تم جلب بيانات المستخدم بنجاح: ${userModel.value!.name}");
      }
    } catch (e) {
      showError("حدث خطأ أثناء تحميل البيانات: ${e.toString()}");
    } finally {
      isLoading.value = false;
      log("🟢 [ProfileController] - انتهى تحميل البيانات");
    }
  }
   void showError(String message) {
    Get.snackbar(
      "خطأ", 
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Get.theme.colorScheme.error,
      colorText: Get.theme.colorScheme.onError,
      duration: const Duration(seconds: 3),
    );
  }
}



