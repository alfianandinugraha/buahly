import 'package:buahly/core/models/nutritions.dart';

class Fruit {
  String name;
  String genus;
  String id;
  String family;
  String order;
  Nutritions nutritions;

  Fruit({
    required this.name,
    required this.genus,
    required this.id,
    required this.family,
    required this.order,
    required this.nutritions
  });

  @override
  String toString() {
    return 'Fruit(name: $name, genus: $genus, id: $id, family: $family, order: $order, nutritions: $nutritions)';
  }

  Fruit copyWith({
    String? name,
    String? genus,
    String? id,
    String? family,
    String? order,
    Nutritions? nutritions,
  }) {
    return Fruit(
      name: name ?? this.name,
      genus: genus ?? this.genus,
      id: id ?? this.id,
      family: family ?? this.family,
      order: order ?? this.order,
      nutritions: nutritions ?? this.nutritions,
    );
  }
}
