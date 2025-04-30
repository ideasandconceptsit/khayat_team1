import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/appointment/models/available_appointment_model.dart';
import 'package:team1_khayat/features/appointment/repos/appointment_repo.dart';
import 'package:team1_khayat/shared/app_snakbar/app_snackbar.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class AppointmentController extends GetxController {
  var createAppointmentState = AppState.idle.obs;
  var getAvailableAppointmentState = AppState.idle.obs;
  late TextEditingController noteController;
  late GlobalKey<FormState> noteFormKey;

  RxMap<DateTime,AvailableAppointmentModel?> availableAppointmentsMap = <DateTime,AvailableAppointmentModel?>{}.obs;
  AppointmentRepo appointmentRepo = AppointmentRepo();

  Rx<DateTime> selectedDate=DateTime.now().obs;
  Rx<int> selectedTimeIndex=0.obs;


  void getAvailableAppointmentsForMonth(DateTime dateTime)async
  {
    if(availableAppointmentsMap.containsKey(DateTime.parse(DateFormat('yyyy-MM-dd')
        .format(dateTime))))
      return;
    getAvailableAppointmentState.value=AppState.loading;
    try {
      List<AvailableAppointmentModel> result= await appointmentRepo.getAvailableAppointmentsForMonth(dateTime);
      selectedDate.value=dateTime;
      for (var element in result) {
        availableAppointmentsMap[element.date]=element;
        log(availableAppointmentsMap.toString());
      }
      selectedTimeIndex.value==0;
      getAvailableAppointmentState.value = AppState.success;
    } catch (e) {
      createAppointmentState.value = AppState.error;
    }
  }

  void bookAppointment(String clientEmail,String clientName,String clientPhone)async{
    createAppointmentState.value=AppState.loading;
    try {
       DateTime selectedDateFormat=DateTime.parse(DateFormat('yyyy-MM-dd')
               .format(selectedDate.value));
       DateTime? selectedAppointmentTime=availableAppointmentsMap[selectedDateFormat]?.availableSlots[selectedTimeIndex.value];
       if(selectedAppointmentTime==null)
         return;


      await appointmentRepo.createAppointment(
        clientEmail: clientEmail,
        clientName: clientName,
        clientPhone: clientPhone,
        date: selectedAppointmentTime,
        note: noteController.text
      );
      createAppointmentState.value = AppState.success;
      availableAppointmentsMap[selectedDateFormat]?.availableSlots.removeAt(selectedTimeIndex.value);
      showSuccessSnackBar(AppStrings.appointmentCreatedSuccessfully.tr);
    } catch (e) {
      createAppointmentState.value = AppState.error;
      showErrorSnackBar(e.toString());
    }
  }


  void changeSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
  void changeSelectedTimeIndex(int index) {
    selectedTimeIndex.value = index;
  }

  @override
  void onInit() {
    getAvailableAppointmentsForMonth(DateTime.now());
    noteController=TextEditingController();
    noteFormKey=GlobalKey<FormState>();
    super.onInit();
  }
  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }
}
