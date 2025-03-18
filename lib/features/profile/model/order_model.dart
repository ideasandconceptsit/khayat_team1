class OrderModels {
  final String id;
  final Client client;
  final List<OrderItem> items;
  final ThobeDetails thobeDetails;
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
  final String orderDate;
  final String createdAt;
  final String updatedAt;
  final String orderNumber;
  final int v;

  OrderModels({
    required this.id,
    required this.client,
    required this.items,
    required this.thobeDetails,
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
    required this.orderNumber,
    required this.v,
  });

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      id: json["id"] ?? "",
      client: Client.fromJson(json["client"]),
      items: (json["items"] as List).map((item) => OrderItem.fromJson(item)).toList(),
      thobeDetails: ThobeDetails.fromJson(json["thobeDetails"]),
      discount: (json["discount"] ?? 0).toDouble(),
      discountType: json["discountType"] ?? "",
      tax: (json["tax"] ?? 0).toDouble(),
      taxRate: (json["taxRate"] ?? 0).toDouble(),
      shipping: (json["shipping"] ?? 0).toDouble(),
      totalPrice: (json["totalPrice"] ?? 0).toDouble(),
      profitAmount: (json["profitAmount"] ?? 0).toDouble(),
      profitPercentage: (json["profitPercentage"] ?? 0).toDouble(),
      paymentStatus: json["paymentStatus"] ?? "",
      paymentMethod: json["paymentMethod"] ?? "",
      amountPaid: (json["amountPaid"] ?? 0).toDouble(),
      status: json["status"] ?? "",
      priority: json["priority"] ?? "",
      tags: List<String>.from(json["tags"] ?? []),
      totalQuantity: json["totalQuantity"] ?? 0,
      balance: (json["balance"] ?? 0).toDouble(),
      orderDate: json["orderDate"] ?? "",
      createdAt: json["createdAt"] ?? "",
      updatedAt: json["updatedAt"] ?? "",
      orderNumber: json["orderNumber"] ?? "",
      v: json["__v"] ?? 0,
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
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
    );
  }
}

class OrderItem {
  final String itemType;
  final Item item;
  final int quantity;
  final double unitPrice;
  final double discount;
  final double totalPrice;
  final String id;

  OrderItem({
    required this.itemType,
    required this.item,
    required this.quantity,
    required this.unitPrice,
    required this.discount,
    required this.totalPrice,
    required this.id,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemType: json["itemType"] ?? "",
      item: Item.fromJson(json["item"]),
      quantity: json["quantity"] ?? 0,
      unitPrice: (json["unitPrice"] ?? 0).toDouble(),
      discount: (json["discount"] ?? 0).toDouble(),
      totalPrice: (json["totalPrice"] ?? 0).toDouble(),
      id: json["_id"] ?? "",
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
  final double profitMargin;
  final double? totalValue;
  final double? totalCost;

  Item({
    required this.id,
    required this.name,
    required this.category,
    required this.supplier,
    required this.sku,
    required this.isLowStock,
    required this.isOverStocked,
    required this.profitMargin,
    this.totalValue,
    this.totalCost,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      category: Category.fromJson(json["category"]),
      supplier: Supplier.fromJson(json["supplier"]),
      sku: json["sku"] ?? "",
      isLowStock: json["isLowStock"] ?? false,
      isOverStocked: json["isOverStocked"] ?? false,
      profitMargin: (json["profitMargin"] ?? 0).toDouble(),
      totalValue: (json["totalValue"] as num?)?.toDouble(),
      totalCost: (json["totalCost"] as num?)?.toDouble(),
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
    );
  }
}

class Supplier {
  final String id;
  final String name;
  final String phone;

  Supplier({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
      id: json["_id"] ?? "",
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
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
      length: (json["length"] ?? 0).toDouble(),
      backLength: (json["backLength"] ?? 0).toDouble(),
      shoulder: (json["shoulder"] ?? 0).toDouble(),
      chestWidth: (json["chestWidth"] ?? 0).toDouble(),
      sleeveLength: (json["sleeveLength"] ?? 0).toDouble(),
      neckWidth: (json["neckWidth"] ?? 0).toDouble(),
      cuffWidth: (json["cuffWidth"] ?? 0).toDouble(),
      jabzorLength: (json["jabzorLength"] ?? 0).toDouble(),
      jabzorWidth: (json["jabzorWidth"] ?? 0).toDouble(),
      takhaleesLength: (json["takhaleesLength"] ?? 0).toDouble(),
      takhaleesWidth: (json["takhaleesWidth"] ?? 0).toDouble(),
      pocketLength: (json["pocketLength"] ?? 0).toDouble(),
      pocketWidth: (json["pocketWidth"] ?? 0).toDouble(),
    );
  }
}
