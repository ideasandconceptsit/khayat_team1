import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';

class SelectTimePickerWidget extends StatelessWidget {
  const SelectTimePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentController appointmentController = Get.find<AppointmentController>();
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 35.w,),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
            () =>  GestureDetector(
              onTap: () async{
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime:appointmentController.fromTime.value ,
                );
               appointmentController.changeSelectedFromTime(picked);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.from,
                    style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                  ),
                  Text(
                    _formatTime(appointmentController.fromTime.value),
                    style:  TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.black87),
          Obx(
                () =>  Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.to,
                      style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
                    ),
                    Text(
                      _formatTime(addMinutesToTimeOfDay(appointmentController.fromTime.value, 30)),
                      style:  TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return "--:--";
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour.$minute";
  }
  TimeOfDay addMinutesToTimeOfDay(TimeOfDay time, int minutesToAdd) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    ).add(Duration(minutes: minutesToAdd));

    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }
}

