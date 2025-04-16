import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/network/dio_utils.dart';
import 'package:team1_khayat/features/appointment/models/appointment_model.dart';

class AppointmentRepo {
  final Dio _dio = DioUtils.getInstance();

  Future<void> createAppointment({
    required String clientName,
    required String clientEmail,
    required DateTime date,
    required int clientPhone,
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
  Future<List<AppointmentModel>> getAppointments() async {
    try {
      final response = await _dio.get(
        'https://khayat-backend.onrender.com/api/appointment',
        options: Options(headers: _getHeaders()),
      );
      if (response.statusCode == 200) {
        return List<AppointmentModel>.from(response.data['data'].map((e) => AppointmentModel.fromJson(e)));
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