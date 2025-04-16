import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/appointment/models/appointment_model.dart';
import 'package:team1_khayat/features/appointment/repos/appointment_repo.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class AppointmentController extends GetxController {
  var createAppointmentState = AppState.idle.obs;

  AppointmentRepo appointmentRepo = AppointmentRepo();
  RxList<AppointmentModel> appointments = <AppointmentModel>[].obs;

  Rx<DateTime> selectedDate = DateTime.now().copyWith(hour: 12, minute: 0).obs;
  Rx<TimeOfDay> fromTime =  const TimeOfDay(hour: 12, minute: 0).obs;


  void createAppointment(
      {required String clientName,
      required String clientEmail,
      required int clientPhone}) async {
    createAppointmentState.value = AppState.loading;
    try {
      var appointmentsList = await appointmentRepo.getAppointments();
      appointments.assignAll(appointmentsList);

      if (hasAppointmentWithin30Minutes()) {
        showErrorSnackBar(AppStrings.appointmentAlreadyExists.tr);
        createAppointmentState.value = AppState.error;
        return;
      }
      await appointmentRepo.createAppointment(
          clientName: clientName,
          clientEmail: clientEmail,
          date: selectedDate.value.copyWith(hour: fromTime.value.hour, minute: fromTime.value.minute).toUtc(),
          clientPhone: clientPhone);
      createAppointmentState.value = AppState.success;
      showSuccessSnackBar(AppStrings.appointmentCreatedSuccessfully.tr);
    } catch (e) {
      showErrorSnackBar(e.toString());
      createAppointmentState.value = AppState.error;
    }
  }

  bool hasAppointmentWithin30Minutes() {
    for (var appointment in appointments) {
      final difference = appointment.date.difference(selectedDate.value.copyWith(hour: fromTime.value.hour, minute: fromTime.value.minute).toUtc()).inMinutes;
      if (difference.abs() <= 30) {
        return true;
      }
    }
    return false;
  }

  void changeSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
  void changeSelectedFromTime(TimeOfDay? time) {
    if(time == null) return;
    fromTime.value = time;
  }
}
