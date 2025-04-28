import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';
import 'package:team1_khayat/features/appointment/views/widgets/chevron_icon.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AppointmentController controller = Get.find<AppointmentController>();

    return Obx(
      () => TableCalendar(
        onPageChanged: (focusedDay) {
          controller.changeSelectedDate(focusedDay);
          controller.getAvailableAppointmentsForMonth(focusedDay);
        },
        firstDay: DateTime.now(),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: controller.selectedDate.value,
        selectedDayPredicate: (day) =>
            isSameDay(controller.selectedDate.value, day),
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
      leftChevronIcon: ChevronIcon(isRight: false,),
      rightChevronIcon: ChevronIcon(isRight: true,),
      formatButtonVisible: false,
      titleCentered: true,
    );
  }
}




