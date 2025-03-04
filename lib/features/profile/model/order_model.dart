class OrderModels {
  final String id;
  final Client client;
  final ThobeDetails thobeDetails;
  final Fabric? fabric;
  final int quantity;
  final double totalPrice;
  final double? unitPrice;
  final double? cost;
  final double? profitAmount;
  final double? profitPercentage;
  final double discount;
  final String status;
  final DateTime deliveryDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double? fabricQuantityUsed;

  OrderModels({
    required this.id,
    required this.client,
    required this.thobeDetails,
    this.fabric,
    required this.quantity,
    required this.totalPrice,
    this.unitPrice,
    this.cost,
    this.profitAmount,
    this.profitPercentage,
    required this.discount,
    required this.status,
    required this.deliveryDate,
    required this.createdAt,
    required this.updatedAt,
    this.fabricQuantityUsed,
  });

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      id: json['_id'],
      client: Client.fromJson(json['client']),
      thobeDetails: ThobeDetails.fromJson(json['thobeDetails']),
      fabric: json['fabric'] != null ? Fabric.fromJson(json['fabric']) : null,
      quantity: json['quantity'],
      totalPrice: (json['totalPrice'] as num).toDouble(),
      unitPrice: json['unitPrice'] != null ? (json['unitPrice'] as num).toDouble() : null,
      cost: json['cost'] != null ? (json['cost'] as num).toDouble() : null,
      profitAmount: json['profitAmount'] != null ? (json['profitAmount'] as num).toDouble() : null,
      profitPercentage: json['profitPercentage'] != null ? (json['profitPercentage'] as num).toDouble() : null,
      discount: (json['discount'] as num).toDouble(),
      status: json['status'],
      deliveryDate: DateTime.parse(json['deliveryDate']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      fabricQuantityUsed: json['fabricQuantityUsed'] != null ? (json['fabricQuantityUsed'] as num).toDouble() : null,
    );
  }
}

class Client {
  final String id;
  final String name;
  final String phone;
  final String email;

  Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class ThobeDetails {
  final double length;
  final double backLength;
  final double shoulder;
  final double chestWidth;
  final double sleeveLength;
  final double neckWidth;
  final double cuffWidth;
  final double jabzorLength;
  final double jabzorWidth;
  final double takhaleesLength;
  final double takhaleesWidth;
  final double pocketLength;
  final double pocketWidth;

  ThobeDetails({
    required this.length,
    required this.backLength,
    required this.shoulder,
    required this.chestWidth,
    required this.sleeveLength,
    required this.neckWidth,
    required this.cuffWidth,
    required this.jabzorLength,
    required this.jabzorWidth,
    required this.takhaleesLength,
    required this.takhaleesWidth,
    required this.pocketLength,
    required this.pocketWidth,
  });

  factory ThobeDetails.fromJson(Map<String, dynamic> json) {
    return ThobeDetails(
      length: (json['length'] as num).toDouble(),
      backLength: (json['backLength'] as num).toDouble(),
      shoulder: (json['shoulder'] as num).toDouble(),
      chestWidth: (json['chestWidth'] as num).toDouble(),
      sleeveLength: (json['sleeveLength'] as num).toDouble(),
      neckWidth: (json['neckWidth'] as num).toDouble(),
      cuffWidth: (json['cuffWidth'] as num).toDouble(),
      jabzorLength: (json['jabzorLength'] as num).toDouble(),
      jabzorWidth: (json['jabzorWidth'] as num).toDouble(),
      takhaleesLength: (json['takhaleesLength'] as num).toDouble(),
      takhaleesWidth: (json['takhaleesWidth'] as num).toDouble(),
      pocketLength: (json['pocketLength'] as num).toDouble(),
      pocketWidth: (json['pocketWidth'] as num).toDouble(),
    );
  }
}

class Fabric {
  final String id;
  final String name;
  final double pricePerMeter;

  Fabric({
    required this.id,
    required this.name,
    required this.pricePerMeter,
  });

  factory Fabric.fromJson(Map<String, dynamic> json) {
    return Fabric(
      id: json['_id'],
      name: json['name'],
      pricePerMeter: (json['pricePerMeter'] as num).toDouble(),
    );
  }
}
