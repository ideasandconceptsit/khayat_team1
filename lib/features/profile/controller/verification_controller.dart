import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/repos/verfication_repository.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';

class VerificationResetCodeController extends GetxController {
  final VerificationRepository verificationRepository;
  VerificationResetCodeController(this.verificationRepository);

   final GlobalKey<FormState> formKeyVerifayCode = GlobalKey<FormState>(); 
  final TextEditingController otpController = TextEditingController();
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> verificationRestCode({required String resetCode}) async {
    print("طلب استعادة كلمة المرور للبريد: $resetCode");

  

    isLoading.value = true;
    errorMessage.value = '';
    print("يتم إرسال الطلب إلى verificationRepository...");

    String? result =
        await verificationRepository.verificationRestCode(resetCode: resetCode);

    if (result == null) {
      print(" تم التحقق من الكود بنجاح");
      SnackbarHelper.showSuccessSnackbar(result ?? 'تم التحقق من الكود بنجاح');
    } else {
      errorMessage.value = result;
      print("خطأ في الإرسال: $result");
      SnackbarHelper.showErrorSnackbar(result);
    }

    isLoading(false);
  }
}
