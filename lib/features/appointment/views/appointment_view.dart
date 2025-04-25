import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';
import 'package:team1_khayat/features/appointment/views/widgets/calendar_widget.dart';
import 'package:team1_khayat/features/appointment/views/widgets/confirm_button.dart';
import 'package:team1_khayat/features/appointment/views/widgets/note_section.dart';
import 'package:team1_khayat/features/appointment/views/widgets/select_time_section.dart';


class AppointmentView extends StatelessWidget {
   AppointmentView({super.key});
   final AppointmentController appointmentController = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            const CalendarWidget(),
            SizedBox(
              height: 24.h,
            ),
            SelectTimeSectionBuilder(),
            SizedBox(
              height: 28.h,
            ),
             NoteSection(),
            SizedBox(height: 47.h,),
            const ConfirmButton()
          ],
        ),
      ),
    );
  }
}






