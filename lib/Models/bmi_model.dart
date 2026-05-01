class BmiResponse {
  final String? status;
  final dynamic error;
  final Human? data;
  final Premium? premium;

  BmiResponse({
    this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'] as String?,
      error: json['error'],
      data: json['data'] != null ? Human.fromJson(json['data']) : null,
      premium:
      json['premium'] != null ? Premium.fromJson(json['premium']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'error': error,
      'data': data?.toJson(),
      'premium': premium?.toJson(),
    };
  }
}

class Human {
 final String? height;
  final String? weight;
  final double? bmi;
  final double? bmiPrime;
  final String? category;
  final String? risk;
  final String? summary;
  final IdealWeightRange? idealWeightRange;
  final double? weightToChange;

  Human({ 
    
    this.height,
    this.weight,
    this.bmi,
    this.bmiPrime,
    this.category,
    this.risk,
    this.summary,
    this.idealWeightRange,
    this.weightToChange,
  });

  factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
      height: json['height'] as String?,
      weight: json['weight'] as String?,
      bmi: (json['bmi'] as num?)?.toDouble(),
      bmiPrime: (json['bmiPrime'] as num?)?.toDouble(),
      category: json['category'] as String?,
      risk: json['risk'] as String?,
      summary: json['summary'] as String?,
      idealWeightRange: json['idealWeightRange'] != null
          ? IdealWeightRange.fromJson(json['idealWeightRange'])
          : null,
      weightToChange: (json['weightToChange'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'bmiPrime': bmiPrime,
      'category': category,
      'risk': risk,
      'summary': summary,
      'idealWeightRange': idealWeightRange?.toJson(),
      'weightToChange': weightToChange,
    };
  }
}

class IdealWeightRange {
  final double? min;
  final double? max;
  final String? unit;

  IdealWeightRange({
    this.min,
    this.max,
    this.unit,
  });

  factory IdealWeightRange.fromJson(Map<String, dynamic> json) {
    return IdealWeightRange(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
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

class Premium {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  Premium({
    this.message,
    this.upgradeUrl,
    this.lockedFields,
  });

  factory Premium.fromJson(Map<String, dynamic> json) {
    return Premium(
      message: json['message'] as String?,
      upgradeUrl: json['upgrade_url'] as String?,
      lockedFields: json['locked_fields'] != null
          ? List<String>.from(json['locked_fields'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'upgrade_url': upgradeUrl,
      'locked_fields': lockedFields,
    };
  }
}