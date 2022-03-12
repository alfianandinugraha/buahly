import 'dart:convert';

import 'package:buahly/core/models/nutritions.dart';

class Fruit {
  String name;
  String genus;
  int id;
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
    int? id,
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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'genus': genus,
      'id': id,
      'family': family,
      'order': order,
      'nutritions': nutritions.toMap(),
    };
  }

  factory Fruit.fromMap(Map<String, dynamic> map) {
    return Fruit(
      name: map['name'] ?? '',
      genus: map['genus'] ?? '',
      id: map['id'] ?? '',
      family: map['family'] ?? '',
      order: map['order'] ?? '',
      nutritions: Nutritions.fromMap(map['nutritions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Fruit.fromJson(String source) => Fruit.fromMap(json.decode(source));
}
