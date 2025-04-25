import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.find<AppointmentController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Obx(
        () =>  CustomAppButton(
          isLoading: controller.createAppointmentState.value == AppState.loading,
          onTap: () {
            if(controller.noteFormKey.currentState!.validate()) {
              controller.bookAppointment("clientName",  "clientEmail", "1236666");
            }
          },
          text: AppStrings.confirm.tr,
          height: 48.h,
          isTextBold: true,
        ),
      ),
    );
  }
}
