import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/appointment/controllers/appointment_controller.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class SelectTimeSection extends StatelessWidget {
  SelectTimeSection({super.key});

  final AppointmentController appointmentController = Get.find();

  String formatTime(String isoString) {
    DateTime dateTime = DateTime.parse(isoString).toLocal();
    return DateFormat.jm().format(dateTime); // "9:30 AM"
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        String selectedDateAvailableSlots = (DateFormat('yyyy-MM-dd')
            .format(appointmentController.selectedDate.value));
        var availableDates = appointmentController
            .availableAppointmentsMap[
                DateTime.parse(selectedDateAvailableSlots)]
            ?.availableSlots;

        if (availableDates != null) {
          return SizedBox(
            height: 125.h,
            child: GridView.builder(
              padding: EdgeInsets.all(10.w),
              itemCount: availableDates.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final time = formatTime(availableDates[index].toString());
                return GestureDetector(
                  onTap: () {
                    appointmentController.changeSelectedTimeIndex(index);
                  },
                  child: Obx(
                    () =>  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            appointmentController.selectedTimeIndex.value == index
                                ? AppColors.purpleColor
                                : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: AppColors.greyColor,
                          width: .4.w,
                        ),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          color: appointmentController.selectedTimeIndex.value ==
                                  index
                              ? Colors.white
                              : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: 125.h,
          child: Center(
            child: Text(AppStrings.noAppointmentAvailableForThisDay.tr),
          ),
        );
      },
    );
  }
}

class SelectTimeSectionSkeletonizer extends StatelessWidget {
  const SelectTimeSectionSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 125.h,
        child: GridView.builder(
          padding: EdgeInsets.all(10.w),
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 12.h,
            childAspectRatio: 2.5,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(
                    color: AppColors.greyColor,
                    width: .4.w,
                  ),
                ),
                child: const Text(
                  "time",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String formatTime(String isoString) {
    DateTime dateTime = DateTime.parse(isoString).toLocal();
    return DateFormat.jm().format(dateTime); // "9:30 AM"
  }
}

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
