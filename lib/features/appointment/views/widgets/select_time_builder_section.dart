import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';
import 'package:team1_khayat/features/appointment/views/widgets/select_time_section.dart';
import 'package:team1_khayat/features/appointment/views/widgets/select_time_section_skeletonizer.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class SelectTimeSectionBuilder extends StatelessWidget {
  SelectTimeSectionBuilder({
    super.key,
  });

  final AppointmentController appointmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (appointmentController.getAvailableAppointmentState.value ==
          AppState.loading) {
        return const SelectTimeSectionSkeletonizer();
      } else if (appointmentController.getAvailableAppointmentState.value ==
          AppState.error) {
        return SizedBox(
          height: 125.h,
          child: Center(
            child: Text(AppStrings.someThingWentWrong.tr),
          ),
        );
      }
      return SelectTimeSection();
    });
  }
}
