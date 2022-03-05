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
}
