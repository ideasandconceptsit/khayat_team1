import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';

class CalendarWidget extends StatelessWidget {
   const CalendarWidget({super.key});


  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.find<AppointmentController>();

    return Obx(
      () =>  TableCalendar(
        onPageChanged: (focusedDay) {
          controller.changeSelectedDate(focusedDay);
          controller.getAvailableAppointmentsForMonth(focusedDay);
        },
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: controller.selectedDate.value,
        selectedDayPredicate: (day) => isSameDay(controller.selectedDate.value, day),
        onDaySelected: (selectedDay, focusedDay) {
          controller.changeSelectedDate(selectedDay);
        },
        calendarStyle: const CalendarStyle(
          isTodayHighlighted: false,
          selectedDecoration: BoxDecoration(
            color: AppColors.purpleColor,
            shape: BoxShape.circle,
          ),
        ),
        headerStyle: _buildHeaderStyle(),
      ),
    );
  }

  HeaderStyle _buildHeaderStyle() {
    return const HeaderStyle(
      leftChevronIcon: LeftChevronIcon(),
      rightChevronIcon: RightChevronIcon(),
      formatButtonVisible: false,
      titleCentered: true,
    );
  }
   // bool isTodayOrInFuture(DateTime date) {
   //  return true;
   //   DateTime now = DateTime.now();
   //   DateTime today = DateTime(now.year, now.month, now.day);
   //   DateTime inputDate = DateTime(date.year, date.month, date.day);
   //   return (inputDate.isAtSameMomentAs(today) || inputDate.isAfter(today));
   // }

}

class RightChevronIcon extends StatelessWidget {
  const RightChevronIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          Icons.chevron_right,
          color: Colors.black87,
          size: 24.w,
        ),
      ),
    );
  }
}

class LeftChevronIcon extends StatelessWidget {
  const LeftChevronIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Icon(
          Icons.chevron_left,
          color: Colors.black87,
          size: 24.w,
        ),
      ),
    );
  }
}
