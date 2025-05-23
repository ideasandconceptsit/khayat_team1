import 'package:get/get.dart';

class AvailableAppointmentModel {
  final DateTime date;
  final RxList<DateTime> availableSlots;
  final int totalSlots;
  final int bookedSlots;

  AvailableAppointmentModel({
    required this.date,
    required List<DateTime> availableSlots,
    required this.totalSlots,
    required this.bookedSlots,
  }) : availableSlots = availableSlots.obs;

  factory AvailableAppointmentModel.fromJson(Map<String, dynamic> json) {
    return AvailableAppointmentModel(
      date: DateTime.parse(json['date']),
      totalSlots: json['totalSlots'],
      bookedSlots: json['bookedSlots'],
      availableSlots: List<String>.from(json['availableSlots'])
          .map((slot) => DateTime.parse(slot))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'totalSlots': totalSlots,
      'bookedSlots': bookedSlots,
      'availableSlots': availableSlots.map((slot) => slot.toIso8601String()).toList(),
    };
  }
}
