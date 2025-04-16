class AppointmentModel {
  final String id;
  final DateTime date;
  final String status;
  final String clientName;
  final int clientPhone;

  AppointmentModel({
    required this.id,
    required this.date,
    required this.status,
    required this.clientName,
    required this.clientPhone,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['_id'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      clientName: json['clientName'],
      clientPhone: json['clientPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'date': date.toIso8601String(),
      'status': status,
      'clientName': clientName,
      'clientPhone': clientPhone,
    };
  }
}
