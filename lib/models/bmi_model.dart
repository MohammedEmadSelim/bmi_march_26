class BmiResponse {
  final String status;
  final dynamic error;
  final BmiData data;
  final Premium premium;

  BmiResponse({
    required this.status,
    this.error,
    required this.data,
    required this.premium,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) {
    return BmiResponse(
      status: json['status'],
      error: json['error'],
      data: BmiData.fromJson(json['data']),
      premium: Premium.fromJson(json['premium']),
    );
  }
}

class BmiData {
  final String height;
  final String weight;
  final double bmi;
  final double? bmiPrime;
  final String category;
  final String? risk;
  final String? summary;
  final IdealWeightRange idealWeightRange;
  final dynamic weightToChange;

  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    this.bmiPrime,
    required this.category,
    this.risk,
    this.summary,
    required this.idealWeightRange,
    this.weightToChange,
  });

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num).toDouble(),
      bmiPrime: json['bmiPrime'] == null
          ? null
          : (json['bmiPrime'] as num).toDouble(),
      category: json['category'],
      risk: json['risk'],
      summary: json['summary'],
      idealWeightRange: IdealWeightRange.fromJson(json['idealWeightRange']),
      weightToChange: json['weightToChange'],
    );
  }
}

class IdealWeightRange {
  final double min;
  final double max;
  final String unit;

  IdealWeightRange({
    required this.min,
    required this.max,
    required this.unit,
  });

  factory IdealWeightRange.fromJson(Map<String, dynamic> json) {
    return IdealWeightRange(
      min: (json['min'] as num).toDouble(),
      max: (json['max'] as num).toDouble(),
      unit: json['unit'],
    );
  }
}

class Premium {
  final String message;
  final String upgradeUrl;
  final List<String> lockedFields;

  Premium({
    required this.message,
    required this.upgradeUrl,
    required this.lockedFields,
  });

  factory Premium.fromJson(Map<String, dynamic> json) {
    return Premium(
      message: json['message'],
      upgradeUrl: json['upgrade_url'],
      lockedFields: List<String>.from(json['locked_fields']),
    );
  }
}