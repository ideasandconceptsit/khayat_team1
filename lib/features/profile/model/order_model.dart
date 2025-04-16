class OrderModels {
  final String? id;
  final String? orderNumber;
  final ClientModel? client;
  final List<ItemModel>? items;
  final double? discount;
  final String? discountType;
  final double? tax;
  final double? taxRate;
  final double? shipping;
  final double? totalPrice;
  final String? paymentStatus;
  final String? paymentMethod;
  final double? amountPaid;
  final String? status;
  final String? priority;
  final int? totalQuantity;
  final double? balance;
  final DateTime? orderDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deliveryDate;
  final String? trackingNumber;
  final String? notes;
  final String? currency;
  final WarehouseModel? warehouse;
  final String? salesPerson;
  final bool? isRefunded;

  OrderModels({
    this.id,
    this.orderNumber,
    this.client,
    this.items,
    this.discount,
    this.discountType,
    this.tax,
    this.taxRate,
    this.shipping,
    this.totalPrice,
    this.paymentStatus,
    this.paymentMethod,
    this.amountPaid,
    this.status,
    this.priority,
    this.totalQuantity,
    this.balance,
    this.orderDate,
    this.createdAt,
    this.updatedAt,
    this.deliveryDate,
    this.trackingNumber,
    this.notes,
    this.currency,
    this.warehouse,
    this.salesPerson,
    this.isRefunded,
  });

  factory OrderModels.fromJson(Map<String, dynamic> json) {
    return OrderModels(
      id: json["_id"],
      orderNumber: json["orderNumber"],
      client: json["client"] != null ? ClientModel.fromJson(json["client"]) : null,
      items: json["items"] != null ? (json["items"] as List).map((item) => ItemModel.fromJson(item)).toList() : null,
      discount: (json["discount"] as num?)?.toDouble(),
      discountType: json["discountType"],
      tax: (json["tax"] as num?)?.toDouble(),
      taxRate: (json["taxRate"] as num?)?.toDouble(),
      shipping: (json["shipping"] as num?)?.toDouble(),
      totalPrice: (json["totalPrice"] as num?)?.toDouble(),
      paymentStatus: json["paymentStatus"],
      paymentMethod: json["paymentMethod"],
      amountPaid: (json["amountPaid"] as num?)?.toDouble(),
      status: json["status"],
      priority: json["priority"],
      totalQuantity: json["totalQuantity"],
      balance: (json["balance"] as num?)?.toDouble(),
      orderDate: json["orderDate"] != null ? DateTime.tryParse(json["orderDate"]) : null,
      createdAt: json["createdAt"] != null ? DateTime.tryParse(json["createdAt"]) : null,
      updatedAt: json["updatedAt"] != null ? DateTime.tryParse(json["updatedAt"]) : null,
      deliveryDate: json["deliveryDate"] != null ? DateTime.tryParse(json["deliveryDate"]) : null,
      trackingNumber: json["trackingNumber"],
      notes: json["notes"],
      currency: json["currency"],
      warehouse: json["warehouse"] != null ? WarehouseModel.fromJson(json["warehouse"]) : null,
      salesPerson: json["salesPerson"],
      isRefunded: json["isRefunded"] ?? false,
    );
  }
}

class ClientModel {
  final String? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? address;

  ClientModel({this.id, this.name, this.phone, this.email, this.address});

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json["_id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      address: json["address"],
    );
  }
}

class ItemModel {
  final String? id;
  final String? itemType;
  final ProductModel? product;
  final int? quantity;
  final double? unitPrice;
  final double? discount;
  final double? totalPrice;

  ItemModel({this.id, this.itemType, this.product, this.quantity, this.unitPrice, this.discount, this.totalPrice});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["_id"],
      itemType: json["itemType"],
      product: json["item"] != null ? ProductModel.fromJson(json["item"]) : null,
      quantity: json["quantity"],
      unitPrice: (json["unitPrice"] as num?)?.toDouble(),
      discount: (json["discount"] as num?)?.toDouble(),
      totalPrice: (json["totalPrice"] as num?)?.toDouble(),
    );
  }
}

class ProductModel {
  final String? id;
  final String? name;
  final String? sku;
  final CategoryModel? category;
  final SupplierModel? supplier;

  ProductModel({this.id, this.name, this.sku, this.category, this.supplier});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      name: json["name"],
      sku: json["sku"],
      category: json["category"] != null ? CategoryModel.fromJson(json["category"]) : null,
      supplier: json["supplier"] != null ? SupplierModel.fromJson(json["supplier"]) : null,
    );
  }
}

class CategoryModel {
  final String? id;
  final String? name;

  CategoryModel({this.id, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(id: json["_id"], name: json["name"]);
  }
}

class SupplierModel {
  final String? id;
  final String? name;
  final String? phone;

  SupplierModel({this.id, this.name, this.phone});

  factory SupplierModel.fromJson(Map<String, dynamic> json) {
    return SupplierModel(
      id: json["_id"],
      name: json["name"],
      phone: json["phone"],
    );
  }
}

class WarehouseModel {
  final String? id;
  final String? name;
  final String? location;

  WarehouseModel({this.id, this.name, this.location});

  factory WarehouseModel.fromJson(Map<String, dynamic> json) {
    return WarehouseModel(
      id: json["_id"],
      name: json["name"],
      location: json["location"],
    );
  }
}
