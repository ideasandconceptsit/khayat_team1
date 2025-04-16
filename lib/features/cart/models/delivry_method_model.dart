class DeliveryMethodModel {
  final EstimatedDeliveryTime estimatedDeliveryTime;
  final WeightLimits weightLimits;
  final String id;
  final String name;
  final String description;
  final double price;
  final bool active;
  final List<String> availableCountries;
  final String carrier;


  DeliveryMethodModel({
    required this.estimatedDeliveryTime,
    required this.weightLimits,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.active,
    required this.availableCountries,
    required this.carrier,

  });

  factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) {
    return DeliveryMethodModel(
      estimatedDeliveryTime: EstimatedDeliveryTime.fromJson(json['estimatedDeliveryTime']),
      weightLimits: WeightLimits.fromJson(json['weightLimits']),
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      active: json['active'],
      availableCountries: List<String>.from(json['availableCountries']),
      carrier: json['carrier'],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'estimatedDeliveryTime': estimatedDeliveryTime.toJson(),
      'weightLimits': weightLimits.toJson(),
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'active': active,
      'availableCountries': availableCountries,
      'carrier': carrier,

    };
  }
}

class EstimatedDeliveryTime {
  final int min;
  final int max;
  final String unit;

  EstimatedDeliveryTime({
    required this.min,
    required this.max,
    required this.unit,
  });

  factory EstimatedDeliveryTime.fromJson(Map<String, dynamic> json) {
    return EstimatedDeliveryTime(
      min: json['min'],
      max: json['max'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
      'unit': unit,
    };
  }
}

class WeightLimits {
  final int min;
  final int max;

  WeightLimits({
    required this.min,
    required this.max,
  });

  factory WeightLimits.fromJson(Map<String, dynamic> json) {
    return WeightLimits(
      min: json['min'],
      max: json['max'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }
}
