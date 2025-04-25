class AddCardModel {
  final String holderName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  AddCardModel({
    required this.holderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv,
  });

  factory AddCardModel.fromJson(Map<String, dynamic> json) {
    return AddCardModel(
      holderName: json['holderName'],
      cardNumber: json['cardNumber'],
      expiryDate: json['expiryDate'],
      cvv: json['cvv'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'holderName': holderName,
      'cardNumber': cardNumber,
      'expiryDate': expiryDate,
      'cvv': cvv,
    };
  }
}
