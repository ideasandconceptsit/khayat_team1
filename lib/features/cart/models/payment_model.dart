// class PaymentModel {
//   final String? id;
//   final String? nameOnCard;
//   final String? cardNumber;
//   final String? expireDate;
//   final String? cVV;
//   final PaymentCardType? paymentCardType;
//
//   PaymentModel({
//     required this.id,
//     required this.nameOnCard,
//     required this.cardNumber,
//     required this.expireDate,
//     required this.cVV,
//     PaymentCardType? paymentCardType,
//   }) : paymentCardType = paymentCardType ?? getCardType(cardNumber ?? '');
//
//   factory PaymentModel.fromJson(Map<String, dynamic> json) {
//     return PaymentModel(
//       id: json['id'],
//       nameOnCard: json['nameOnCard'],
//       cardNumber: json['cardNumber'],
//       expireDate: json['expireDate'],
//       cVV: json['cVV'],
//       paymentCardType: getCardType(json['cardNumber'] ?? ''),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'nameOnCard': nameOnCard,
//       'cardNumber': cardNumber,
//       'expireDate': expireDate,
//       'cVV': cVV,
//       'paymentCardType': paymentCardType.toString().split('.').last,
//     };
//   }
//
//   PaymentModel copyWith({
//     String? id,
//     String? nameOnCard,
//     String? cardNumber,
//     String? expireDate,
//     String? cVV,
//     PaymentCardType? paymentCardType,
//   }) {
//     return PaymentModel(
//       id: id ?? this.id,
//       nameOnCard: nameOnCard ?? this.nameOnCard,
//       cardNumber: cardNumber ?? this.cardNumber,
//       expireDate: expireDate ?? this.expireDate,
//       cVV: cVV ?? this.cVV,
//       paymentCardType: paymentCardType ?? getCardType(cardNumber ?? this.cardNumber ?? ''),
//     );
//   }
//
//   static PaymentCardType getCardType(String cardNumber) {
//     if (cardNumber.isEmpty) {
//       return PaymentCardType.Undefined;
//     }
//     if (cardNumber.startsWith('4')) {
//       return PaymentCardType.Visa;
//     } else if (isMasterCardNumber(cardNumber)) {
//       return PaymentCardType.MasterCard;
//     } else {
//       return PaymentCardType.Undefined;
//     }
//   }
//
//   static bool isMasterCardNumber(String? cardNumber) {
//     if (cardNumber == null || cardNumber.isEmpty) return false;
//     return RegExp(r'^(5[1-5]|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[0-1][0-9]|2720)')
//         .hasMatch(cardNumber);
//   }
// }
//
// enum PaymentCardType { Visa, MasterCard, Undefined }