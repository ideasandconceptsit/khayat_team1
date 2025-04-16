class CreateOrderModel {
  final String client;
  final List<Item> items;
  final double subtotal;
  final double discount;
  final String discountType;
  final double tax;
  final double taxRate;
  final double shipping;
  final double totalPrice;
  final double totalCost;
  final double profitAmount;
  final double profitPercentage;
  final String paymentStatus;
  final String paymentMethod;
  final double amountPaid;
  final double balance;
  final String status;
  final String priority;
  final String notes;
  final DateTime orderDate;
  final DateTime requiredDate;

  CreateOrderModel({
    required this.client,
    required this.items,
    required this.subtotal,
    required this.discount,
    required this.discountType,
    required this.tax,
    required this.taxRate,
    required this.shipping,
    required this.totalPrice,
    required this.totalCost,
    required this.profitAmount,
    required this.profitPercentage,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.amountPaid,
    required this.balance,
    required this.status,
    required this.priority,
    required this.notes,
    required this.orderDate,
    required this.requiredDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'client': client,
      'items': items.map((item) => item.toJson()).toList(),
      'subtotal': subtotal,
      'discount': discount,
      'discountType': discountType,
      'tax': tax,
      'taxRate': taxRate,
      'shipping': shipping,
      'totalPrice': totalPrice,
      'totalCost': totalCost,
      'profitAmount': profitAmount,
      'profitPercentage': profitPercentage,
      'paymentStatus': paymentStatus,
      'paymentMethod': paymentMethod,
      'amountPaid': amountPaid,
      'balance': balance,
      'status': status,
      'priority': priority,
      'notes': notes,
      'orderDate': orderDate.toIso8601String(),
      'requiredDate': requiredDate.toIso8601String(),
    };
  }

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderModel(
      client: json['client'],
      items: (json['items'] as List)
          .map((itemJson) => Item.fromJson(itemJson))
          .toList(),
      subtotal: json['subtotal'],
      discount: json['discount'],
      discountType: json['discountType'],
      tax: json['tax'],
      taxRate: json['taxRate'],
      shipping: json['shipping'],
      totalPrice: json['totalPrice'],
      totalCost: json['totalCost'],
      profitAmount: json['profitAmount'],
      profitPercentage: json['profitPercentage'],
      paymentStatus: json['paymentStatus'],
      paymentMethod: json['paymentMethod'],
      amountPaid: json['amountPaid'],
      balance: json['balance'],
      status: json['status'],
      priority: json['priority'],
      notes: json['notes'],
      orderDate: DateTime.parse(json['orderDate']),
      requiredDate: DateTime.parse(json['requiredDate']),
    );
  }
}

class Item {
  final String itemType;
  final String item;
  final int quantity;
  final String unit;
  final double unitPrice;
  final double unitCost;
  final double discount;
  final double totalPrice;
  final double totalCost;
  final String notes;

  Item({
    required this.itemType,
    required this.item,
    required this.quantity,
    required this.unit,
    required this.unitPrice,
    required this.unitCost,
    required this.discount,
    required this.totalPrice,
    required this.totalCost,
    required this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemType': itemType,
      'item': item,
      'quantity': quantity,
      'unit': unit,
      'unitPrice': unitPrice,
      'unitCost': unitCost,
      'discount': discount,
      'totalPrice': totalPrice,
      'totalCost': totalCost,
      'notes': notes,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemType: json['itemType'],
      item: json['item'],
      quantity: json['quantity'],
      unit: json['unit'],
      unitPrice: json['unitPrice'],
      unitCost: json['unitCost'],
      discount: json['discount'],
      totalPrice: json['totalPrice'],
      totalCost: json['totalCost'],
      notes: json['notes'],
    );
  }
}
