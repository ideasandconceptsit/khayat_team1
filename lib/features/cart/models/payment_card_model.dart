

class PaymentCardModel {
  final String id;
  final String userId;
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final PaymentCardType? paymentCardType;

  PaymentCardModel({
    required this.id,
    required this.userId,
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
     this.createdAt,
     this.updatedAt,
    PaymentCardType? paymentCardType,
  }) : paymentCardType = paymentCardType ?? getCardType(cardNumber ?? '');

  factory PaymentCardModel.fromJson(Map<String, dynamic> json) {
    return PaymentCardModel(
      id: json['_id'],
      userId: json['user'],
      holderName: json['holderName'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      paymentCardType: getCardType(json['cardNumber'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': userId,
      'holderName': holderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'paymentCardType': paymentCardType.toString(),
    };
  }

  static PaymentCardType getCardType(String cardNumber) {
    if (cardNumber.isEmpty) {
      return PaymentCardType.Undefined;
    }
    if (cardNumber.startsWith('4')) {
      return PaymentCardType.Visa;
    } else if (isMasterCardNumber(cardNumber)) {
      return PaymentCardType.MasterCard;
    } else {
      return PaymentCardType.Undefined;
    }
  }

  static bool isMasterCardNumber(String? cardNumber) {
    if (cardNumber == null || cardNumber.isEmpty) return false;
    return RegExp(r'^(5[1-5]|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[0-1][0-9]|2720)')
        .hasMatch(cardNumber);
  }

}
enum PaymentCardType {Visa, MasterCard, Undefined }
