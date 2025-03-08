class OrderModels {
  final String id;
  final String orderNumber;
  final Client client;
  final List<OrderItem> items;
  final double discount;
  final String discountType;
  final double tax;
  final double taxRate;
  final double shipping;
  final double totalPrice;
  final double profitAmount;
  final double profitPercentage;
  final String paymentStatus;
  final String paymentMethod;
  final double amountPaid;
  final String status;
  final String priority;
  final List<String> tags;
  final int totalQuantity;
  final double balance;
  final DateTime orderDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  OrderModels({
    required this.id,
    required this.orderNumber,
    required this.client,
    required this.items,
    required this.discount,
    required this.discountType,
    required this.tax,
    required this.taxRate,
    required this.shipping,
    required this.totalPrice,
    required this.profitAmount,
    required this.profitPercentage,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.amountPaid,
    required this.status,
    required this.priority,
    required this.tags,
    required this.totalQuantity,
    required this.balance,
    required this.orderDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      id: json["id"],
      orderNumber: json["orderNumber"],
      client: Client.fromJson(json["client"]),
      items: (json["items"] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      discount: json["discount"].toDouble(),
      discountType: json["discountType"],
      tax: json["tax"].toDouble(),
      taxRate: json["taxRate"].toDouble(),
      shipping: json["shipping"].toDouble(),
      totalPrice: json["totalPrice"].toDouble(),
      profitAmount: json["profitAmount"].toDouble(),
      profitPercentage: json["profitPercentage"].toDouble(),
      paymentStatus: json["paymentStatus"],
      paymentMethod: json["paymentMethod"],
      amountPaid: json["amountPaid"].toDouble(),
      status: json["status"],
      priority: json["priority"],
      tags: List<String>.from(json["tags"] ?? []),
      totalQuantity: json["totalQuantity"],
      balance: json["balance"].toDouble(),
      orderDate: DateTime.parse(json["orderDate"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
}

class Client {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String address;

  Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json["_id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      address: json["address"],
    );
  }
}

class OrderItem {
  final String id;
  final String itemType;
  final Item item;
  final int quantity;
  final double unitPrice;
  final double discount;
  final double totalPrice;

  OrderItem({
    required this.id,
    required this.itemType,
    required this.item,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
    required this.totalPrice,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json["id"],
      itemType: json["itemType"],
      item: Item.fromJson(json["item"]),
      quantity: json["quantity"],
      unitPrice: json["unitPrice"].toDouble(),
      discount: json["discount"].toDouble(),
      totalPrice: json["totalPrice"].toDouble(),
    );
  }
}

class Item {
  final String id;
  final String name;
  final Category category;
  final Supplier supplier;
  final String sku;
  final bool isLowStock;
  final bool isOverStocked;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.supplier,
    required this.sku,
    required this.isLowStock,
    required this.isOverStocked,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["_id"],
      name: json["name"],
      category: Category.fromJson(json["category"]),
      supplier: Supplier.fromJson(json["supplier"]),
      sku: json["sku"],
      isLowStock: json["isLowStock"],
      isOverStocked: json["isOverStocked"],
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      name: json["name"],
    );
  }
}

class Supplier {
  final String id;
  final String name;
  final String phone;

  Supplier({required this.id, required this.name, required this.phone});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json["_id"],
      name: json["name"],
      phone: json["phone"],
    );
  }
}