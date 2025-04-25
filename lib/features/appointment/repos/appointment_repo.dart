import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/appointment/models/available_appointment_model.dart';
import 'package:team1_khayat/features/appointment/models/create_appointment_model.dart';
import 'package:intl/intl.dart';

class AppointmentRepo {
  final Dio _dio = DioUtils.getInstance();

  Future<void> createAppointment({
    required String clientName,
    required String clientEmail,
    required String note,
    required DateTime date,
    required String clientPhone,
  }) async {
    try {
      final response = await _dio.post(
        'https://khayat-backend.onrender.com/api/appointment',
        options: Options(headers: _getHeaders()),
        data: {
          'clientName': clientName,
          'clientEmail': clientEmail,
          'date': date.toIso8601String(),
          'clientPhone': clientPhone,
          'note': note,
        },
      );

      if (response.statusCode == 201) {
        print('Client added successfully');
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception();
      }
    } on DioException catch (e) {
      if(e.response != null) {
        throw Exception(e.response!.data['message']);
      }
      throw Exception(e.message);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong);
    }
  }
  Future<List<AvailableAppointmentModel>> getAvailableAppointmentsForMonth(DateTime dateTime) async {
    try {
      final response = await _dio.get(
        '/api/appointment/monthly-available-timeslots/${DateFormat('yyyy/MM').format(dateTime)}',
        options: Options(headers: _getHeaders()),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        return List<AvailableAppointmentModel>.from(response.data.map((e) => AvailableAppointmentModel.fromJson(e)));
      } else {
        print('Error: ${response.statusCode} - ${response.statusMessage}');
        throw Exception(AppStrings.someThingWentWrong);
      }
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.statusCode} - ${e.message}');
      throw _exceptionFromResponse(e);
    } catch (e) {
      print('Unexpected Error: $e');
      throw Exception(AppStrings.someThingWentWrong);
    }
  }


  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2N2Q0YmViNzljZWZkZTI4YWY2MjlkZDYiLCJpYXQiOjE3NDE5OTU3MDYsImV4cCI6MTc0OTc3MTcwNn0.MfH0NI5oq5T-PS8eReIFmrKMo16LjNJhU4haiIFTrPE',
    };
  }
  Exception _exceptionFromResponse(DioException e) {
    if(e.response != null) {
      return Exception(e.response!.data['message']);
    }
    else {
      return Exception(AppStrings.someThingWentWrong.tr);
    }
  }

}