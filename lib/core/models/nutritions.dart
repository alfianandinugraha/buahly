import 'dart:convert';

class Nutritions {
  double carbohydrates;
  double protein;
  double fat;
  double calories;
  double sugar;

  Nutritions({
    required this.carbohydrates,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.sugar,
  });

  @override
  String toString() {
    return 'Nutritions(carbohydrates: $carbohydrates, protein: $protein, fat: $fat, calories: $calories, sugar: $sugar)';
  }

  Nutritions copyWith({
    double? carbohydrates,
    double? protein,
    double? fat,
    double? calories,
    double? sugar,
  }) {
    return Nutritions(
      carbohydrates: carbohydrates ?? this.carbohydrates,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      calories: calories ?? this.calories,
      sugar: sugar ?? this.sugar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'carbohydrates': carbohydrates,
      'protein': protein,
      'fat': fat,
      'calories': calories,
      'sugar': sugar,
    };
  }

  factory Nutritions.fromMap(Map<String, dynamic> map) {
    return Nutritions(
      carbohydrates: map['carbohydrates']?.toDouble() ?? 0.0,
      protein: map['protein']?.toDouble() ?? 0.0,
      fat: map['fat']?.toDouble() ?? 0.0,
      calories: map['calories']?.toDouble() ?? 0.0,
      sugar: map['sugar']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Nutritions.fromJson(String source) => Nutritions.fromMap(json.decode(source));
}
